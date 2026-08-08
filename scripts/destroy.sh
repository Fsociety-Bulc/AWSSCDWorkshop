#!/usr/bin/env bash
set -euo pipefail

STACK_NAME="${STACK_NAME:-aws-scd-workshop}"
REGION="${AWS_REGION:-us-east-1}"

command -v aws >/dev/null || { echo "AWS CLI is required."; exit 1; }

output() {
  aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --query "Stacks[0].Outputs[?OutputKey=='$1'].OutputValue | [0]" \
    --output text
}

empty_bucket() {
  local bucket="$1"
  [[ -z "$bucket" || "$bucket" == "None" ]] && return

  echo "Emptying s3://${bucket}..."
  aws s3 rm "s3://${bucket}" --recursive --region "$REGION" >/dev/null

  while true; do
    local versions
    versions="$(aws s3api list-object-versions \
      --bucket "$bucket" \
      --region "$REGION" \
      --query '{Objects: [Versions[], DeleteMarkers[]][] | [].{Key: Key, VersionId: VersionId}, Quiet: `true`}' \
      --output json)"

    if [[ "$versions" == *'"Objects": null'* || "$versions" == *'"Objects": []'* ]]; then
      break
    fi

    aws s3api delete-objects \
      --bucket "$bucket" \
      --region "$REGION" \
      --delete "$versions" >/dev/null
  done
}

empty_bucket "$(output WebsiteBucketName)"
empty_bucket "$(output ArtifactBucketName)"

echo "Deleting stack ${STACK_NAME}; CloudFront cleanup can take several minutes..."
aws cloudformation delete-stack --stack-name "$STACK_NAME" --region "$REGION"
aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME" --region "$REGION"
echo "Stack deleted. Remove the GitHub app installation separately only if you no longer need it."
