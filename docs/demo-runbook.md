# Live demo runbook

## Outcome

Show one visible webpage change moving from GitHub to AWS through CodePipeline. Target duration: 8 minutes. Students should understand the Source → Check → Deploy story, not every CloudFormation property.

## Prepare before the event

1. Deploy `infra/template.yaml` at least one day before the session. Use the README one-command CloudShell setup or:

   ```bash
   AWS_REGION=us-east-1 \
     bash scripts/bootstrap.sh \
     Fsociety-Bulc Artificial-intelligence-BULC-Lab \
     feat/aws-devops-beginner-codepipeline
   ```

2. In the stack Outputs, open `ConnectionSetupUrl`.
3. Select `student-devops-github`, choose **Update pending connection**, and authorize the AWS Connector for GitHub app.
4. Confirm the connection status is `AVAILABLE`.
5. Open `PipelineConsoleUrl` and choose **Release change** once if the pending connection caused the initial execution to fail.
6. Confirm Source, Check, and Deploy are green.
7. Bookmark `WebsiteUrl`; confirm it says `v1.0` and “Ship with confidence.”
8. Prepare but do not commit these v2 values:
   - version: `v2.0`
   - message: `My first automated AWS deployment!`
   - accent: `#38bdf8`
9. Open tabs in this order: live site, GitHub `demo/app.js`, CodePipeline, latest CodeBuild logs, CloudFormation Outputs.
10. Sign in before screen sharing, close unrelated tabs, disable notifications, and use 150–175% browser/terminal zoom.
11. Keep `dist/slides.html`, the PDF, and fallback screenshots available offline.

Do not create CloudFront or complete the connection handshake on stage. Those setup operations are slower and distract from the DevOps feedback loop.

## Eight-minute sequence

### 0:00–0:45 — Establish version 1

Open `WebsiteUrl`. Point to `v1.0`, “Ship with confidence.”, and the `LIVE` status.

Say: “This page is stored in a private S3 bucket and delivered by CloudFront. We will change it by pushing to Git—not by uploading a file in the AWS console.”

### 0:45–2:00 — Make one obvious change

Open `demo/app.js` and change only the release object:

```js
const release = {
  version: "v2.0",
  message: "My first automated AWS deployment!",
  accent: "#38bdf8"
};
```

Say: “The application change is tiny. The delivery system stays the same for every change.”

### 2:00–3:00 — Commit and push

Use a prepared Git interface or terminal:

```bash
git add demo/app.js
git commit -m "demo: launch v2 live"
git push
```

Never display credentials, environment dumps, account IDs, or unrelated repositories.

### 3:00–5:30 — Follow Source, Check, and Deploy

Open CodePipeline and narrate the execution:

1. **Source:** CodeConnections detected the configured branch push and CodePipeline fetched that commit.
2. **Check:** CodeBuild verified the three website files, checked the JavaScript syntax, and packaged only `demo/`.
3. **Deploy:** the S3 deploy action extracted that checked artifact into the private website bucket.

Open the Check action details only if the logs are immediately available. Point out the commit ID and execution status. If AWS is still working, recap the architecture rather than watching a spinner silently.

### 5:30–7:00 — Reveal version 2

When all stages are green, return to `WebsiteUrl` and refresh. The deploy action sets browser no-cache headers and the CloudFront policy sets edge TTLs to zero, so a normal refresh should show v2. Point to the new version, headline, and blue accent.

Say: “The commit is the change record; the pipeline is the checklist; AWS is the runtime.”

### 7:00–8:00 — Connect it to IaC

Open the CloudFormation Resources or Outputs tab—not the full template. Explain that the same stack created the connection, pipeline, build project, private buckets, CloudFront distribution, logs, and service roles.

Say: “We automated the application delivery, and we also wrote the environment as code. That is why another account can reproduce this system.”

## Recovery decisions

- **No venue internet:** show the fallback recording/screenshots and narrate the same three stages.
- **Pipeline does not start:** confirm the push used the configured branch; then use **Release change**. Do not edit the pipeline live.
- **Source fails:** the GitHub connection may not be `AVAILABLE`; explain the one-time trust handshake and switch to fallback.
- **Check fails:** call it successful early feedback. Show the short CodeBuild message, restore the prepared v2 file, push, or switch to fallback.
- **Deploy fails:** do not repair IAM on stage; use screenshots and continue the story.
- **Website returns 403:** no successful deployment has populated S3 yet. Use the v1 screenshot.
- **Website still shows v1:** wait up to 30 seconds and refresh once. If unchanged, reveal the v2 screenshot.
- **Accidental code issue:** revert the commit or restore v1 and push. Frame the same pipeline as the recovery path.

Do not spend more than 45 seconds troubleshooting during the session.

## After the session

If the environment is no longer needed:

```bash
AWS_REGION=us-east-1 bash scripts/destroy.sh
```

Confirm the stack is deleted. CloudFront cleanup can take several minutes. Remove the GitHub app installation only when no other AWS connection uses it.
