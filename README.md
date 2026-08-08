# From Code to Cloud — AWS Student Community Day Workshop

A beginner-friendly live demo showing one pull-request merge become a deployed website through GitHub, AWS CodePipeline, CodeBuild, private Amazon S3, and CloudFront.

## Demo story

1. Open a prepared PR that changes `demo/app.js` from v1 to v2.
2. Merge the PR into `main`.
3. AWS CodeConnections detects the new commit.
4. CodePipeline runs **Source → Check → Deploy**.
5. Refresh the CloudFront URL and reveal the new website.

## Deploy the workshop

Use AWS CloudShell in `us-east-1`:

```bash
curl -fsSL "https://raw.githubusercontent.com/Fsociety-Bulc/AWSSCDWorkshop/refs/heads/main/infra/template.yaml" -o /tmp/awsscd-workshop.yaml && aws cloudformation deploy --stack-name aws-scd-workshop --region us-east-1 --template-file /tmp/awsscd-workshop.yaml --capabilities CAPABILITY_IAM
```

After deployment, open the stack **Outputs**:

1. Open `ConnectionSetupUrl`, select `awsscdworkshop-github`, and choose **Update pending connection**.
2. Authorize the AWS Connector for GitHub app for `Fsociety-Bulc/AWSSCDWorkshop`.
3. Open `PipelineConsoleUrl` and choose **Release change** once for the initial deployment.
4. Open `WebsiteUrl` after Source, Check, and Deploy are green.

The connection authorization is a one-time human trust decision. Every later merge to `main` starts the pipeline automatically.

## Repository map

- `demo/` — static website changed during the workshop
- `buildspec.yml` — CodeBuild validation and packaging
- `infra/template.yaml` — complete AWS environment
- `scripts/bootstrap.sh` — optional AWS CLI deployment
- `scripts/destroy.sh` — bucket cleanup and stack deletion
- `docs/demo-runbook.md` — timed PR-merge demo instructions
- `slides/` and `dist/` — presentation sources and exports

## Local validation and slide build

```bash
node --check demo/app.js
npm ci
npm run build
```

## Cleanup

```bash
AWS_REGION=us-east-1 bash scripts/destroy.sh
```

CloudFront deletion can take several minutes. AWS services used by this workshop may incur charges, so delete the stack after the event.

## License

MIT. AWS and GitHub names and marks belong to their respective owners.
