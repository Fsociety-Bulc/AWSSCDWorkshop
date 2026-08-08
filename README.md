# From Code to Cloud — Beginner DevOps on AWS

A beginner-first AWS Student Community Day session kit: 21 portrait slides, speaker notes, one simple webpage, one CloudFormation stack, and one visible GitHub-to-AWS pipeline.

> No Kubernetes. No containers. No Bedrock. Start with the problem DevOps solves, then watch one Git push become a live website.

## Session profile

- Speaker: FarhanAshrafDev
- Format: 45 minutes, including an 8-minute live demo and 4-minute Q&A
- Audience: 100–120 attendees; most are new to cloud and DevOps
- Display: portrait 768×896 venue canvas
- Demo: GitHub → AWS CodeConnections → CodePipeline → CodeBuild → private S3 → CloudFront
- Infrastructure: one CloudFormation template

## What students need

To follow the session:

- A GitHub account and basic Git: clone, edit, add, commit, and push
- Ability to read a small HTML/CSS/JavaScript change
- No AWS account unless they want to reproduce the demo

To reproduce the complete demo:

- An AWS account with permission to manage CloudFormation, IAM, CodeConnections, CodePipeline, CodeBuild, S3, CloudFront, and CloudWatch Logs
- Ownership of a personal GitHub repository, or approval from the GitHub organization owner to install/authorize the AWS Connector for GitHub app
- Push access to the branch selected for the pipeline; push access alone is not enough to authorize a new GitHub connection

They do **not** need Python, Docker, Kubernetes, Helm, EKS, Argo CD, or AI knowledge.

Skills introduced in the session:

- Why DevOps uses culture, practices, automation, and feedback
- Git as the change history
- CI/CD as a repeatable delivery path
- Infrastructure as Code with AWS CloudFormation
- Basic AWS IAM, S3, CloudFront, CodeBuild, and CodePipeline
- Failure feedback, rollback thinking, logs, and cleanup

## One-stack deployment

The fastest setup is **one CloudShell command plus one GitHub authorization**. The stack defaults to this public branch in `us-east-1`.

1. [**Open AWS CloudShell in `us-east-1`**](https://console.aws.amazon.com/cloudshell/home?region=us-east-1).
2. Paste this command and wait for `Successfully created/updated stack`:

   ```bash
   curl -fsSL "https://raw.githubusercontent.com/Fsociety-Bulc/Artificial-intelligence-BULC-Lab/refs/heads/feat/aws-devops-beginner-codepipeline/infra/template.yaml" -o /tmp/student-devops-template.yaml && aws cloudformation deploy --stack-name student-devops-pipeline --region us-east-1 --template-file /tmp/student-devops-template.yaml --capabilities CAPABILITY_IAM --parameter-overrides GitHubOwner=Fsociety-Bulc GitHubRepo=Artificial-intelligence-BULC-Lab GitHubBranch=feat/aws-devops-beginner-codepipeline ConnectionName=student-devops-github
   ```

3. Open the [`student-devops-pipeline` stack](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks) and choose its **Outputs** tab.
4. Open `ConnectionSetupUrl`, select the pending connection, and choose **Update pending connection**.
5. Authorize the AWS Connector for GitHub app for the selected repository.
6. Open `PipelineConsoleUrl` and choose **Release change** once, or push a commit.
7. When Source, Check, and Deploy are green, open `WebsiteUrl`.

CloudFormation quick-create accepts S3-hosted templates, not raw GitHub URLs. The command above downloads the public template before deploying it, so it avoids a broken launch link while still creating the complete environment as one stack. Change the owner, repository, branch, and connection-name values in the command if you use a fork.

CloudFormation creates the connection resource, but AWS intentionally leaves it `PENDING` until a human authorizes GitHub. That one handshake is the only manual integration step. Every later push to the configured branch starts the pipeline automatically.

### Local CLI alternative

```bash
AWS_REGION=us-east-1 \
  bash scripts/bootstrap.sh \
  Fsociety-Bulc Artificial-intelligence-BULC-Lab \
  feat/aws-devops-beginner-codepipeline
```

The script deploys the same template and prints the connection, pipeline, and website URLs. It does not configure GitHub secrets or store AWS keys in GitHub.

## Architecture

```text
Git push
   │
   ▼
AWS CodeConnections ── one-time GitHub authorization
   │
   ▼
AWS CodePipeline
   ├── SOURCE  gets the configured branch
   ├── CHECK   CodeBuild validates and packages demo/
   └── DEPLOY  extracts the package into private S3
                                  │
                                  ▼
                         Amazon CloudFront
                                  │
                                  ▼
                              Web browser
```

`infra/template.yaml` creates:

- A GitHub connection and push-triggered CodePipeline
- A CodeBuild project using `buildspec.yml`
- A private pipeline-artifact S3 bucket
- A private, encrypted, versioned website S3 bucket
- A CloudFront distribution with Origin Access Control
- Least-privilege service roles and short-retention build logs
- Stack outputs for the connection, pipeline, website, and cleanup

The deploy action gives every page asset `Cache-Control: no-cache, no-store, must-revalidate`, while the CloudFront policy sets edge TTLs to zero. This keeps the live reveal fresh in both the browser and CloudFront.

The native S3 deploy action is intentionally simple and **additive**: it adds or overwrites files from `demo/`, but it does not delete old S3 keys when a file is removed from Git. Keep the three demo filenames stable; `scripts/destroy.sh` removes all objects and versions during cleanup.

## Live demo change

Edit only the object at the top of `demo/app.js`:

```js
const release = {
  version: "v2.0",
  message: "My first automated AWS deployment!",
  accent: "#38bdf8"
};
```

Then commit and push:

```bash
git add demo/app.js
git commit -m "demo: launch v2 live"
git push
```

The connection detects the push, CodePipeline downloads the source, CodeBuild runs the checks in `buildspec.yml`, and the deploy stage publishes only `demo/`. See [the live-demo runbook](docs/demo-runbook.md) for stage narration and recovery points.

## Why this is DevOps

- **Small change:** one release object changes.
- **Shared history:** Git records who changed what.
- **Automated checks:** CodeBuild stops missing or invalid files.
- **Repeatable delivery:** CodePipeline executes the same stages every time.
- **Infrastructure as Code:** CloudFormation recreates the complete environment.
- **Fast feedback:** pipeline status and logs show success or failure quickly.
- **Observable result:** the audience sees the deployed version in a browser.

## Repository map

```text
.
├── buildspec.yml              # Beginner-friendly CodeBuild checks
├── demo/                      # Simple webpage changed on stage
├── docs/                      # Runbook, rehearsal, fallback, customization
├── infra/template.yaml        # Entire AWS environment as code
├── scripts/bootstrap.sh       # Optional CLI stack deployment
├── scripts/destroy.sh         # Empty buckets and delete the stack
├── slides/deck.md             # 21-slide Marp source
├── slides/speaker-notes.md    # 45-minute delivery notes
├── slides/theme.css           # 768×896 portrait theme
└── package.json               # Reproducible deck builds
```

## Build the slides

Requirements: Node.js 18 or newer and a Chromium-compatible browser for PDF/PPTX export.

```bash
npm install
npm run build
```

Outputs:

- `dist/slides.html` — recommended venue playback
- `dist/devops-on-aws.pdf` — offline fallback
- `dist/devops-on-aws.pptx` — PowerPoint-compatible deck

Override the QR destination if you copy the kit:

```bash
REPO_URL="https://github.com/OWNER/REPO" npm run build
```

## Cleanup

CloudFront deletion can take several minutes. The script empties both S3 buckets, including website versions, before deleting the stack:

```bash
AWS_REGION=us-east-1 bash scripts/destroy.sh
```

Delete the AWS Connector for GitHub app installation separately only if it is no longer used by another connection.

## Security and cost notes

- No AWS access key or GitHub personal access token is stored in the repository.
- The GitHub app connection is authorized once and referenced by ARN.
- CodePipeline and CodeBuild receive IAM service roles limited to this demo.
- Both S3 buckets block public access; CloudFront alone reads website objects.
- Pipeline artifacts are separate from the website and expire after 30 days.
- S3, CloudFront, CodePipeline, CodeBuild, CloudWatch Logs, and data transfer may incur charges; clean up after rehearsal.

## Official references

- [AWS CloudFormation connection resource](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codeconnections-connection.html)
- [Update a pending AWS CodeConnections connection](https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-update.html)
- [CodePipeline connection source action](https://docs.aws.amazon.com/codepipeline/latest/userguide/action-reference-CodestarConnectionSource.html)
- [CodePipeline S3 deploy action](https://docs.aws.amazon.com/codepipeline/latest/userguide/action-reference-S3Deploy.html)
- [Introduction to DevOps on AWS](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/introduction-to-devops.html)
- [Practicing CI/CD on AWS](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/welcome.html)

AWS documentation content was summarized and rephrased for licensing compliance.

## License

Original code and session content are available under the MIT License. AWS and GitHub names and marks belong to their respective owners.
