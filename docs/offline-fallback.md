# Offline fallback plan

A live demo is a story with evidence. If the network fails, preserve the story and replace live evidence with prepared evidence.

## Capture these assets

Store them locally under `fallback/` before the event:

1. `01-site-v1.png` — initial CloudFront website
2. `02-code-change.png` — edited `release` object
3. `03-workflow-running.png` — GitHub Actions stages
4. `04-oidc-step.png` — temporary credential step
5. `05-workflow-success.png` — green run and summary
6. `06-site-v2.png` — deployed website
7. `demo-recording.mp4` — 60–90 second end-to-end recording

The `fallback/` directory is intentionally not populated because it should contain screenshots from the speaker’s real repository and AWS account. Avoid capturing account IDs, email addresses, tokens, unrelated repositories, or browser notifications.

## Presentation sequence

1. Say plainly: “The venue network is not cooperating, so I’ll use the exact run I recorded during rehearsal.”
2. Play the short recording or advance through the six screenshots.
3. Narrate the same stages: commit, validation, OIDC, S3 sync, CloudFront invalidation, reveal.
4. Return to the “What just happened?” slide.

Do not spend more than 45 seconds troubleshooting on stage. Reliability includes having a rollback path for the presentation itself.
