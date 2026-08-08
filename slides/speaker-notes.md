# Speaker notes — From Code to Cloud

Target: 45 minutes, including an 8-minute live demo and 4-minute Q&A. Audience: approximately 100–120 people; 65% cloud beginners, 15% intermediate students, 15% professionals, and 5% other attendees. Display: portrait 768×896 pixels.

The session is deliberately introductory. Campus Copilot, containers, EKS, Helm, and GitOps are not prerequisites or teaching topics here. The workload is one static webpage so students can focus on DevOps, automation, feedback, and Infrastructure as Code.

## 1. From Code to Cloud — 1:00

Welcome everyone and introduce yourself as FarhanAshrafDev. Promise one outcome: beginners will understand what happens between `git push` and a live AWS deployment.

Say: “You do not need to know DevOps yet. That is why we are here.”

## 2. Cloud in 30 seconds — 1:00

Explain cloud without a product list: rent building blocks on demand and control them through APIs. “Programmable” is the bridge to DevOps. If a resource has an API, a tool can create it repeatedly.

## 3. Quick show of hands — 1:00

Pause after each question. The final question is not a test; it gives permission to be a beginner. Establish that deployment is a shared engineering problem rather than an AWS vocabulary contest.

## 4. It works on my machine — 2:00

Tell a simple story: a developer sends a ZIP file, another person uploads it, nobody knows which version is live, and rollback means searching chat for an older ZIP.

Key line: “Manual deployment depends on memory; reliable delivery depends on a system.”

## 5. DevOps is a way of working — 2:00

Define DevOps through culture, practices, and automation. It is not one job title, one team, or one tool. Culture creates shared ownership. Practices create feedback. Automation makes good practices repeatable.

## 6. Before versus with DevOps — 2:00

Contrast large, risky releases with small, frequent changes. Automation does not remove people. Humans make decisions and review changes; machines execute the repetitive checklist.

Key line: “High speed is the result of confidence, not carelessness.”

## 7. One change, five questions — 2:00

Walk through Code, Build, Check, Deploy, Observe. For today’s static site, “build” means validate and package the three files. Real projects may compile code, run tests, or build a container, but the loop is the same.

## 8. CI/CD without the alphabet soup — 2:00

Use a group-project analogy. Combining everyone’s work only on the final night hurts. CI means integrate and check frequently. Continuous delivery keeps a release ready. Continuous deployment lets a passing change go live automatically.

Do not spend time policing terminology. Focus on automated feedback.

## 9. The environment is also code — 2:00

Separate three ideas: application code defines user behavior, pipeline code defines the delivery checklist, and infrastructure code defines AWS resources and permissions.

Point to `infra/template.yaml`: one file describes the website, pipeline, connection, storage, delivery, logs, and IAM roles.

## 10. ClickOps versus Infrastructure as Code — 2:00

Console clicks are useful for learning, but memory is not a reproducible system. CloudFormation makes the environment versioned, reviewable, repeatable, and removable as one stack.

Say: “The console shows state. The template explains intent.”

## 11. Skills required — 2:00

Make the path feel achievable. Today requires basic Git, the ability to read a tiny JavaScript object, curiosity, and permission to experiment. Explicitly say that Docker, Kubernetes, EKS, Argo CD, and AI are not required.

Explain the next layers: Linux, IAM, networking, CI/CD, Infrastructure as Code, and monitoring. Students should learn by building one project, not by collecting twenty tool names.

## 12. Six AWS building blocks — 2:00

Give each service one sentence:

- CloudFormation creates the environment.
- CodeConnections authorizes one GitHub repository.
- CodePipeline coordinates visible stages.
- CodeBuild checks and packages the website.
- S3 stores private objects.
- CloudFront is the public HTTPS front door.

Tell students not to memorize names. First understand the jobs; tools can change.

## 13. Architecture — 2:30

Trace the path slowly from top to bottom. A GitHub push reaches the authorized connection. CodePipeline runs Source, Check, and Deploy. CodeBuild produces an artifact containing only `demo/`. The deploy action writes it to private S3. CloudFront reads S3 through Origin Access Control and serves the browser.

Security line: “GitHub does not receive an AWS access key, and the S3 bucket does not become public.”

## 14. Setup once, push forever — 1:30

CloudFormation creates the connection in `PENDING` state. A human must choose **Update pending connection** and approve the GitHub app. Explain why that is healthy: infrastructure code may request a trust relationship, but a person authorizes access to the repository.

After that one handshake, pushes automatically start CodePipeline.

## 15. Demo mission — 1:00

Set expectations before changing windows. You will show v1, edit only `demo/app.js`, commit, push, watch three stages, and reveal v2. Ask the audience to predict whether the pipeline succeeds.

## 16. Live demo — 8:00

Follow `docs/demo-runbook.md`. Keep the browser and terminal at 150–175% zoom. Do not create the stack or authorize GitHub on stage; those are setup tasks.

Narration sequence:

1. Show the existing v1.0 webpage.
2. Open `demo/app.js`; change version, message, and accent.
3. Commit and push to the configured branch.
4. Open CodePipeline and show Source starting.
5. Open the Check stage details and explain the three file checks.
6. Watch Deploy turn green; do not stare silently while waiting.
7. Refresh `WebsiteUrl` and reveal v2.0.
8. Point to the original commit and the exact pipeline execution as evidence.

If anything stalls for 45 seconds, use the fallback recording or screenshots.

## 17. What just happened? — 2:00

Reconstruct the invisible work. The connection detected a push. CodePipeline fetched one commit. CodeBuild checked and packaged the site. The S3 deploy action updated the private bucket. CloudFront returned the new files.

Key line: “The commit is the change record; the pipeline is the checklist; AWS is the runtime.”

## 18. Stop early and limit access — 2:00

A failed check should stop before deployment. To recover, revert the Git change and use the same pipeline instead of inventing emergency steps.

Explain security in plain language: the GitHub app can access the approved repository, pipeline service roles can access only the required demo resources, and the website bucket remains private.

A red pipeline is useful feedback delivered early.

## 19. First 30 days — 2:00

Give beginners an achievable sequence. Week 1: Git and Linux. Week 2: IAM, S3, and networking. Week 3: CodeBuild and CodePipeline. Week 4: CloudFormation and CloudWatch.

Suggested portfolio project: deploy a static profile page through this pipeline, add one check, deliberately break it, recover it, and explain the evidence.

## 20. Three takeaways — 1:00

Ask the audience to repeat: small, automated, observable. Connect small to lower risk, automated to repeatability, and observable to fast feedback.

## 21. Questions and repository — 4:00

Invite attendees to scan the QR code. Explain that the repository contains the deck, webpage, one-stack CloudFormation template, buildspec, runbook, fallback plan, and cleanup script.

If nobody asks immediately, seed a question: “Is DevOps just CI/CD?” Answer: no. CI/CD is one practice. DevOps also includes culture, ownership, Infrastructure as Code, security, operations, measurement, and learning.
