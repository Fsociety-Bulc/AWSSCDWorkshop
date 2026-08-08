# Rehearsal checklist

## One week before

- [ ] Confirm the SMD is portrait and accepts a 768×896 source without cropping.
- [ ] Export HTML, PDF, and PPTX; test all three on the presentation laptop.
- [ ] Deploy the CloudFormation stack with the final repository owner, name, and branch.
- [ ] Complete **Update pending connection** and confirm CodeConnections shows `AVAILABLE`.
- [ ] Run CodePipeline successfully from Source through Check and Deploy.
- [ ] Confirm `WebsiteUrl` shows the v1 page from `demo/`.
- [ ] Confirm the repository QR points to this beginner branch.
- [ ] Record a clean 60–90 second fallback demo.

## One day before

- [ ] Restore `demo/app.js` to v1 values and push it through the pipeline.
- [ ] Confirm the CloudFront page loads from a phone using mobile data.
- [ ] Merge a harmless test PR into `main` and confirm CodePipeline starts automatically.
- [ ] Save screenshots of v1, the Git change, each running pipeline stage, the green pipeline, and v2.
- [ ] Bookmark `WebsiteUrl`, `PipelineConsoleUrl`, `ConnectionSetupUrl`, and CloudFormation Outputs.
- [ ] Clone or download the repository locally.
- [ ] Turn off operating-system and browser notifications.

## At the venue

- [ ] Test the actual 768×896 SMD input and safe margins.
- [ ] Set browser and terminal zoom to 150–175%.
- [ ] Check Wi-Fi and keep a phone hotspot ready.
- [ ] Open tabs in runbook order and sign in before screen sharing.
- [ ] Start with the HTML deck; keep the PDF open as backup.
- [ ] Put fallback screenshots and video in one local folder.
- [ ] Confirm the laptop is charging and sleep is disabled.

## Final technical checks

- [ ] Connection status is `AVAILABLE`, not `PENDING`.
- [ ] Stack parameters reference the branch you will push.
- [ ] `buildspec.yml` validates and packages only `demo/`.
- [ ] Source, Check, and Deploy are green for v1.
- [ ] Website and artifact buckets are private.
- [ ] The cleanup script targets the correct stack and Region.

## Final verbal checks

- [ ] Define DevOps as culture, practices, automation, and feedback.
- [ ] Explain CI/CD without assuming prior knowledge.
- [ ] Explain Infrastructure as Code before naming CloudFormation.
- [ ] Say that GitHub authorization is a one-time human decision.
- [ ] Mention failure feedback, recovery, cost, and cleanup.
- [ ] End with: small, automated, observable.
