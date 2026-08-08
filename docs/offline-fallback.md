# Offline fallback plan

A live demo is a story with evidence. If the network fails, preserve the story and replace live evidence with prepared evidence.

## Capture these assets

Store sanitized copies locally under `fallback/` before the event:

1. `01-site-v1.png` — initial CloudFront webpage
2. `02-code-change.png` — edited `release` object in `demo/app.js`
3. `03-codepipeline-source.png` — Source stage processing the GitHub commit
4. `04-codebuild-check.png` — successful file and JavaScript checks
5. `05-codepipeline-deploy.png` — green Source, Check, and Deploy stages
6. `06-site-v2.png` — deployed blue-accent v2 webpage
7. `07-cloudformation-resources.png` — sanitized stack resource list
8. `demo-recording.mp4` — 60–90 second end-to-end recording

The repository does not contain real captures because they should come from the speaker’s AWS account and authorized GitHub repository. Hide account IDs, email addresses, connection ARNs, tokens, unrelated repositories, and browser notifications.

## Presentation sequence

1. Say: “The venue network is not cooperating, so I’ll use the exact run recorded during rehearsal.”
2. Show v1 and the three-value Git change.
3. Show Source receiving the commit.
4. Show CodeBuild checks and the packaged website artifact.
5. Show the green Deploy stage.
6. Reveal v2.
7. Show the CloudFormation resource list and close the IaC story.
8. Return to the “What just happened?” slide.

Narrate the same path: push, source, check, deploy, user result, feedback. Do not spend more than 45 seconds troubleshooting on stage. Reliability includes a fallback path for the presentation itself.
