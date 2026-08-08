# One-click CloudFormation deployment

CloudFormation quick-create links require an S3-hosted template. Raw GitHub URLs are not accepted as `templateURL`. The organizer publishes the already-public workshop template once; attendees then use the generated **Launch Stack** link.

## Organizer: publish the launch template

Run in AWS CloudShell from the repository root:

```bash
AWS_REGION=us-east-1 bash scripts/publish-launch-template.sh
```

The script:

1. validates `infra/template.yaml` with CloudFormation;
2. creates an encrypted, versioned S3 bucket if needed;
3. permits public read of only `infra/template.yaml`;
4. uploads the template; and
5. prints the quick-create URL and Markdown launch button.

The template contains no credentials or secrets and is already public in GitHub. If account-level S3 Block Public Access forbids this narrowly scoped policy, use the README CloudShell deployment command instead.

## Attendee/organizer: launch

1. Open the generated **Launch Stack** URL while signed into AWS.
2. Review the prefilled `aws-scd-workshop` stack and acknowledge IAM resource creation.
3. Choose **Create stack**.
4. In Outputs, open `ConnectionSetupUrl` and authorize `awsscdworkshop-github`.
5. Open `PipelineConsoleUrl` and choose **Release change** for the initial run.
6. Open `WebsiteUrl` after all stages are green.

The GitHub handshake cannot be automated: AWS intentionally requires a repository owner to authorize the connection.

## Remove the launch bucket

After the event, delete the launch object and bucket if it is no longer needed:

```bash
BUCKET=awsscdworkshop-launch-ACCOUNT_ID-us-east-1
aws s3 rm "s3://${BUCKET}" --recursive
aws s3api delete-bucket --bucket "${BUCKET}" --region us-east-1
```

See the [AWS quick-create documentation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-create-stacks-quick-create-links.html). External documentation was summarized and rephrased for licensing compliance.
