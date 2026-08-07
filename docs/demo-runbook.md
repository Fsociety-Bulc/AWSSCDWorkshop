# Live demo runbook

## Outcome

Show a visible website change moving from GitHub to AWS through an automated pipeline. Target duration: 8 minutes. The audience should understand the sequence, not every line of YAML.

## Prepare before the event

1. Run `bash scripts/bootstrap.sh FarhanAshrafDev devops-on-aws-community-day main` at least one day before the session.
2. Trigger one successful deployment and bookmark the CloudFront URL.
3. Confirm the site says `v1.0` and “Ship with confidence.”
4. Prepare the v2 values but do not commit them:
   - version: `v2.0`
   - message: `My first automated AWS deployment!`
   - accent: `#38bdf8`
5. Open browser tabs in this order: live site, repository `demo/app.js`, GitHub Actions, workflow YAML, AWS CloudFormation outputs.
6. Sign in before screen sharing. Close unrelated tabs and disable notifications.
7. Zoom browser and terminal to 150–175% for the 768×896 SMD.
8. Keep `dist/slides.html`, the PDF, and fallback screenshots available offline.

## Eight-minute sequence

### 0:00–0:45 — Establish version 1

Open the CloudFront site. Point to `v1.0`, the current headline, and the `LIVE` status.

Say: “This is already hosted from a private S3 bucket and delivered by CloudFront. Let’s change production without opening the AWS console.”

### 0:45–2:00 — Make one obvious change

Open `demo/app.js`. Change only the `release` object to the prepared v2 values. Do not type workflow or IAM YAML live.

Say: “The application change is tiny. The delivery path remains exactly the same for every change.”

### 2:00–3:00 — Commit and push

Use your prepared Git interface or terminal. Keep the commit message simple:

```text
demo: launch v2 live
```

Push to `main`. Never show credentials or environment dumps.

### 3:00–5:30 — Follow the pipeline

Open the new GitHub Actions run. Narrate these stages:

1. Repository checkout
2. Configuration and file checks
3. OIDC request for temporary AWS credentials
4. S3 synchronization
5. CloudFront invalidation

If waiting, revisit the architecture verbally. Do not stare silently at a spinner.

### 5:30–7:00 — Reveal version 2

When the job is green, open its summary, then return to the CloudFront site. Hard refresh only if necessary. Point to the new version, headline, and accent color.

Say: “The commit is the change record; the workflow is the checklist; AWS is the runtime.”

### 7:00–8:00 — Prove the security point

Show the workflow’s `permissions` block and `configure-aws-credentials` step. Explain that `id-token: write` allows an OIDC token request and that AWS returns temporary credentials after checking repository and branch claims.

Do not open GitHub secrets, IAM credential reports, account identifiers, or raw tokens.

## Recovery decisions

- **No venue internet:** use the fallback recording/screenshots and narrate the same five stages.
- **Workflow does not start:** manually dispatch **Deploy live demo** from Actions.
- **Missing repository variables:** do not repair permissions live; switch to fallback.
- **OIDC failure:** explain that the trust policy rejected identity, then switch to fallback.
- **CloudFront still shows v1:** open the workflow summary, wait up to 45 seconds, then hard refresh. If unchanged, use the S3/CloudFront architecture slide and continue.
- **Accidental code issue:** revert the commit or restore the three v1 values and push. Frame it as rollback.

## After the session

Run `bash scripts/destroy.sh` if the environment is no longer required. Confirm the CloudFormation stack is deleted and note that CloudFront cleanup can take several minutes.
