# Live PR-merge demo runbook

## Outcome

Show a prepared pull request moving from review to a live CloudFront website through **Source → Check → Deploy**. Target duration: 8 minutes.

## Prepare before the event

1. Deploy the stack and authorize `awsscdworkshop-github`.
2. Confirm the pipeline follows `Fsociety-Bulc/AWSSCDWorkshop:main`.
3. Run the pipeline once and confirm `WebsiteUrl` shows v1.0.
4. Prepare a PR from `demo/release-v2` into `main` changing only `demo/app.js`.
5. Keep the PR unmerged until the live demo.
6. Open tabs in this order: v1 website, prepared PR, CodePipeline, CloudFormation Outputs.
7. Keep screenshots and `dist/slides.html` available offline.

## Eight-minute sequence

### 0:00–1:00 — Establish version 1

Open `WebsiteUrl`. Point to v1.0 and explain that private S3 stores the files while CloudFront serves them.

### 1:00–2:30 — Review the pull request

Open the prepared PR and show the three visible release changes: version, message, and accent color. Explain that `main` is the deployment source of truth.

### 2:30–3:15 — Merge

Choose **Merge pull request** and confirm. Say: “The merge created a new commit on main; nobody is uploading files in the AWS console.”

### 3:15–5:45 — Follow the pipeline

1. **Source:** CodeConnections detects the new commit on `main`.
2. **Check:** CodeBuild validates the three website files and JavaScript syntax.
3. **Deploy:** CodePipeline extracts the checked artifact into private S3.

If AWS is still working, recap the architecture instead of watching silently.

### 5:45–7:00 — Reveal version 2

After all stages are green, refresh `WebsiteUrl`. Point out v2.0, the new message, and blue accent.

### 7:00–8:00 — Connect it to Infrastructure as Code

Show CloudFormation Outputs. Explain that one template created the pipeline, build project, private buckets, CloudFront distribution, logs, and IAM roles.

## Recovery

- Pipeline does not start: confirm the PR merged into `main`, then choose **Release change**.
- Source fails: switch to fallback; do not repair GitHub authorization on stage.
- Check fails: describe it as fast feedback and use the prepared screenshots.
- Website remains v1: wait 30 seconds, refresh once, then use the v2 screenshot.
- Spend no more than 45 seconds troubleshooting live.
