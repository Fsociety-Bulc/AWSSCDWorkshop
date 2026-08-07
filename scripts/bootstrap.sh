#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-}"
REPO="${2:-}"
BRANCH="${3:-main}"
STACK_NAME="${STACK_NAME:-devops-community-day-demo}"
REGION="${AWS_REGION:-us-east-1}"

if [[ -z "$OWNER" || -z "$REPO" ]]; then
  echo "Usage: bash scripts/bootstrap.sh <github-owner> <github-repo> [branch]"
  exit 1
fi

command -v aws >/dev/null || { echo "AWS CLI is required."; exit 1; }
aws sts get-caller-identity >/dev/null

OIDC_ARN=""
while read -r candidate; do
  [[ -z "$candidate" ]] && continue
  provider_url="$(aws iam get-open-id-connect-provider \
    --open-id-connect-provider-arn "$candidate" \
    --query Url --output text 2>/dev/null || true)"
  if [[ "$provider_url" == "token.actions.githubusercontent.com" ]]; then
    OIDC_ARN="$candidate"
    break
  fi
done < <(aws iam list-open-id-connect-providers \
  --query 'OpenIDConnectProviderList[].Arn' --output text | tr '\t' '\n')

echo "Deploying AWS stack ${STACK_NAME} in ${REGION}..."
aws cloudformation deploy \
  --stack-name "$STACK_NAME" \
  --region "$REGION" \
  --template-file infra/template.yaml \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
    GitHubOwner="$OWNER" \
    GitHubRepo="$REPO" \
    GitHubBranch="$BRANCH" \
    ExistingGitHubOidcProviderArn="$OIDC_ARN" \
  --no-fail-on-empty-changeset

output() {
  aws cloudformation describe-stacks \
    --stack-name "$STACK_NAME" \
    --region "$REGION" \
    --query "Stacks[0].Outputs[?OutputKey=='$1'].OutputValue | [0]" \
    --output text
}

ROLE_ARN="$(output GitHubDeploymentRoleArn)"
BUCKET="$(output DemoBucketName)"
DISTRIBUTION_ID="$(output CloudFrontDistributionId)"
DEMO_URL="$(output DemoUrl)"

set_repo_variable() {
  local name="$1"
  local value="$2"
  if gh api "repos/${OWNER}/${REPO}/actions/variables/${name}" \
      -X PATCH -f name="$name" -f value="$value" >/dev/null 2>&1; then
    return
  fi
  gh api "repos/${OWNER}/${REPO}/actions/variables" \
    -X POST -f name="$name" -f value="$value" >/dev/null
}

GITHUB_CONFIGURED=false
if command -v gh >/dev/null; then
  echo "Configuring GitHub Actions repository variables..."
  if set_repo_variable AWS_ROLE_ARN "$ROLE_ARN" \
      && set_repo_variable AWS_REGION "$REGION" \
      && set_repo_variable DEMO_BUCKET "$BUCKET" \
      && set_repo_variable CLOUDFRONT_DISTRIBUTION_ID "$DISTRIBUTION_ID"; then
    GITHUB_CONFIGURED=true
  else
    echo "GitHub API access could not configure every variable."
  fi
fi

if [[ "$GITHUB_CONFIGURED" != "true" ]]; then
  echo "Add these GitHub Actions repository variables manually:"
  echo "AWS_ROLE_ARN=$ROLE_ARN"
  echo "AWS_REGION=$REGION"
  echo "DEMO_BUCKET=$BUCKET"
  echo "CLOUDFRONT_DISTRIBUTION_ID=$DISTRIBUTION_ID"
fi

echo ""
echo "Infrastructure ready."
echo "Demo URL: $DEMO_URL"
echo "Push a demo/ change to $BRANCH or run the Deploy live demo workflow."
