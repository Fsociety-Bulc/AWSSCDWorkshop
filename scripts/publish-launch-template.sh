#!/usr/bin/env bash
set -euo pipefail

REGION="${AWS_REGION:-us-east-1}"
STACK_NAME="${STACK_NAME:-aws-scd-workshop}"
KEY="${TEMPLATE_KEY:-infra/template.yaml}"

command -v aws >/dev/null || { echo "AWS CLI is required."; exit 1; }
command -v python3 >/dev/null || { echo "Python 3 is required."; exit 1; }
aws sts get-caller-identity >/dev/null

ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"
PARTITION="$(aws sts get-caller-identity --query Arn --output text | cut -d: -f2)"
BUCKET="${1:-awsscdworkshop-launch-${ACCOUNT_ID}-${REGION}}"

if ! aws s3api head-bucket --bucket "$BUCKET" 2>/dev/null; then
  echo "Creating launch-template bucket ${BUCKET}..."
  if [[ "$REGION" == "us-east-1" ]]; then
    aws s3api create-bucket --bucket "$BUCKET" --region "$REGION" >/dev/null
  else
    aws s3api create-bucket --bucket "$BUCKET" --region "$REGION" \
      --create-bucket-configuration "LocationConstraint=${REGION}" >/dev/null
  fi
fi

aws s3api put-bucket-encryption --bucket "$BUCKET" --region "$REGION" \
  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
aws s3api put-bucket-versioning --bucket "$BUCKET" --region "$REGION" \
  --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket "$BUCKET" --region "$REGION" \
  --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false

POLICY="$(printf '{"Version":"2012-10-17","Statement":[{"Sid":"ReadLaunchTemplate","Effect":"Allow","Principal":"*","Action":"s3:GetObject","Resource":"arn:%s:s3:::%s/%s"}]}' "$PARTITION" "$BUCKET" "$KEY")"
aws s3api put-bucket-policy --bucket "$BUCKET" --region "$REGION" --policy "$POLICY"
aws cloudformation validate-template --region "$REGION" --template-body file://infra/template.yaml >/dev/null
aws s3 cp infra/template.yaml "s3://${BUCKET}/${KEY}" --region "$REGION" \
  --content-type application/yaml --cache-control no-cache >/dev/null

TEMPLATE_URL="https://${BUCKET}.s3.${REGION}.amazonaws.com/${KEY}"
ENCODED_URL="$(python3 -c 'import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1], safe=""))' "$TEMPLATE_URL")"
LAUNCH_URL="https://${REGION}.console.aws.amazon.com/cloudformation/home?region=${REGION}#/stacks/quickcreate?templateURL=${ENCODED_URL}&stackName=${STACK_NAME}"

echo "Launch Stack URL:"
echo "$LAUNCH_URL"
echo ""
echo "Markdown button:"
echo "[![Launch Stack](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png)](${LAUNCH_URL})"
