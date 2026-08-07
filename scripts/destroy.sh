#!/usr/bin/env bash
set -euo pipefail

STACK_NAME="${STACK_NAME:-devops-community-day-demo}"
REGION="${AWS_REGION:-us-east-1}"

BUCKET="$(aws cloudformation describe-stacks \
  --stack-name "$STACK_NAME" \
  --region "$REGION" \
  --query "Stacks[0].Outputs[?OutputKey=='DemoBucketName'].OutputValue | [0]" \
  --output text)"

if [[ -n "$BUCKET" && "$BUCKET" != "None" ]]; then
  echo "Emptying versioned bucket $BUCKET..."
  aws s3 rm "s3://${BUCKET}" --recursive --region "$REGION"
  aws s3api delete-objects \
    --bucket "$BUCKET" \
    --region "$REGION" \
    --delete "$(aws s3api list-object-versions \
      --bucket "$BUCKET" \
      --region "$REGION" \
      --query '{Objects: [Versions[],DeleteMarkers[]].{Key:Key,VersionId:VersionId}, Quiet: `true`}' \
      --output json)" >/dev/null 2>&1 || true
fi

echo "Deleting stack $STACK_NAME..."
aws cloudformation delete-stack --stack-name "$STACK_NAME" --region "$REGION"
aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME" --region "$REGION"
echo "Stack deleted. The shared GitHub OIDC provider is retained when it was supplied to the stack."
