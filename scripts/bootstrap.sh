#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-Fsociety-Bulc}"
REPO="${2:-Artificial-intelligence-BULC-Lab}"
BRANCH="${3:-feat/aws-devops-beginner-codepipeline}"
STACK_NAME="${STACK_NAME:-student-devops-pipeline}"
REGION="${AWS_REGION:-us-east-1}"
CONNECTION_NAME="${CONNECTION_NAME:-student-devops-github}"

command -v aws >/dev/null || { echo "AWS CLI is required."; exit 1; }
aws sts get-caller-identity >/dev/null

echo "Deploying ${STACK_NAME} in ${REGION}..."
aws cloudformation deploy \
  --stack-name "$STACK_NAME" \
  --region "$REGION" \
  --template-file infra/template.yaml \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
    GitHubOwner="$OWNER" \
    GitHubRepo="$REPO" \
    GitHubBranch="$BRANCH" \
    ConnectionName="$CONNECTION_NAME" \
  --no-fail-on-empty-changeset

output() {
  aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --query "Stacks[0].Outputs[?OutputKey=='$1'].OutputValue | [0]" \
    --output text
}

echo ""
echo "Stack created. Finish these two human steps:"
echo "1. Open $(output ConnectionSetupUrl)"
echo "   Select ${CONNECTION_NAME}, choose 'Update pending connection', and authorize GitHub."
echo "2. Open $(output PipelineConsoleUrl)"
echo "   Choose 'Release change' once, or push to ${OWNER}/${REPO}:${BRANCH}."
echo ""
echo "Website after a green pipeline: $(output WebsiteUrl)"
