# From Code to Cloud — DevOps on AWS

A complete, Git-ready session kit for AWS Student Community Day Islamabad: portrait SMD slides, speaker notes, a static live-demo application, secure AWS infrastructure, GitHub Actions deployment, and stage fallback material.

## Session profile

- Speaker: FarhanAshrafDev
- Format: 45 minutes; 8-minute live demo; 4-minute Q&A
- Audience: 100–120 attendees, primarily students new to cloud
- Display: custom portrait 768×896 canvas for the venue SMD
- Demo: GitHub Actions → AWS IAM OIDC → private S3 → CloudFront

## Repository map

```text
.
├── .github/workflows/deploy-demo.yml  # Secure CI/CD workflow
├── demo/                              # Static website changed on stage
├── docs/                              # Runbook, rehearsal, fallback, customization
├── infra/template.yaml                # CloudFormation infrastructure
├── scripts/                           # Bootstrap, cleanup, deck utilities
├── slides/deck.md                     # Marp slide source
├── slides/speaker-notes.md            # 45-minute delivery notes
├── slides/theme.css                   # 768×896 SMD theme
└── package.json                       # Reproducible slide builds
```

## Build the slides

Requirements: Node.js 18 or newer and a Chromium-compatible browser for PDF/PPTX export.

```bash
npm install
npm run build
```

Outputs are written to `dist/`:

- `slides.html` — best fidelity and easiest venue playback
- `devops-on-aws.pdf` — offline fallback
- `devops-on-aws.pptx` — editable PowerPoint-compatible deck

For a browser preview:

```bash
npm run preview
```

The repository URL encoded in the final-slide QR defaults to this repository. Override it before building with:

```bash
REPO_URL="https://github.com/OWNER/REPO" npm run build
```

## Deploy the live demo

### 1. Push this repository to GitHub

The default workflow trusts the `main` branch. Change the branch in both the bootstrap command and workflow trigger if needed.

### 2. Authenticate your local AWS CLI

Use an AWS account where you may create CloudFormation, IAM, S3, and CloudFront resources. Confirm the account before deploying:

```bash
aws sts get-caller-identity
```

### 3. Bootstrap AWS and GitHub

```bash
bash scripts/bootstrap.sh FarhanAshrafDev devops-on-aws-community-day main
```

The script:

1. Reuses an account-level GitHub OIDC provider when one exists, otherwise CloudFormation creates it.
2. Creates a private, encrypted, versioned S3 bucket.
3. Creates a CloudFront distribution with Origin Access Control.
4. Creates a deployment role restricted to this repository and branch.
5. Configures four GitHub repository variables through the GitHub API when `gh` is available.

No long-lived AWS credentials are stored in GitHub.

### 4. Trigger the initial deployment

Change a file under `demo/` and push to `main`, or run **Deploy live demo** from GitHub Actions. CloudFront provisioning can take several minutes the first time; create the stack before arriving at the venue.

## Stage change

Edit only the object at the top of `demo/app.js`:

```js
const release = {
  version: "v2.0",
  message: "My first automated AWS deployment!",
  accent: "#38bdf8"
};
```

Commit and push. The workflow validates the inputs, obtains temporary AWS credentials through OIDC, syncs `demo/` to S3, and invalidates CloudFront.

See [the demo runbook](docs/demo-runbook.md) for exact narration and recovery points.

## Cleanup

CloudFront must be disabled and deleted by CloudFormation, which can take several minutes. Run:

```bash
bash scripts/destroy.sh
```

The stack deletes its OIDC provider only when the stack originally created it. If an existing account-level provider was supplied, it remains untouched.

## Security design

- No permanent AWS keys in GitHub
- Trust policy restricted to `OWNER/REPO` and one branch
- IAM permissions restricted to one S3 bucket and one CloudFront distribution
- S3 public access fully blocked
- CloudFront Origin Access Control signs S3 requests
- Deployment concurrency prevents overlapping production updates

## Presentation sources and further reading

- [Introduction to DevOps on AWS](https://docs.aws.amazon.com/whitepapers/latest/introduction-devops-aws/introduction-to-devops.html)
- [Practicing CI/CD on AWS](https://docs.aws.amazon.com/whitepapers/latest/practicing-continuous-integration-continuous-delivery/welcome.html)
- [AWS DevOps Guidance](https://docs.aws.amazon.com/wellarchitected/latest/devops-guidance/welcome.html)
- [GitHub: Configuring OIDC in AWS](https://docs.github.com/en/actions/how-tos/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
- [AWS Security Blog: IAM roles for GitHub Actions](https://aws.amazon.com/blogs/security/use-iam-roles-to-connect-github-actions-to-actions-in-aws/)
- [AWS Architecture Icons](https://aws.amazon.com/architecture/icons/)
- [AWS DevOps End-to-End Workshop](https://github.com/aws-samples/aws-devops-end-to-end-workshop)

The deck summarizes and rephrases concepts from these references; it does not reproduce AWS presentation slides. Content was rephrased for compliance with licensing restrictions.

## License

Original code and session content in this repository are available under the MIT License. AWS names and marks belong to Amazon Web Services, Inc.; GitHub names and marks belong to GitHub, Inc.
