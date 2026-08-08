# Speaker notes — From Code to Cloud

Target: 42–45 minutes, including an 8-minute live demo and 4-minute Q&A. Audience: beginner-heavy and Gen Z. Keep one idea per slide, ask short prediction questions, and never read the cards word-for-word.

## 1. 14 days mostly waiting — 1:15
Open without introducing yourself. Let the number sit for two seconds. Explain the historical Amazon case: coding took roughly a day and a half, build/deploy work took under an hour, but queues stretched idea-to-customer time to about 15.5 days. The problem was flow, not typing speed.

## 2. One deploy every 11.7 seconds — 1:00
Use the “wait, what?” moment. This is a historical 2011 aggregate often attributed to John Jenkins’ Velocity talk: about 23,000 production deployments per day across Amazon. It does not mean one application deployed every 11.7 seconds, and it is not a current AWS-wide claim. The lesson is decentralized teams plus automation.

## 3. From Code to Cloud — 0:45
Introduce yourself and promise one visible outcome: merge a tiny pull request and watch AWS turn it into a live website. “No Kubernetes side quest today.”

## 4. The mission — 1:00
Frame DevOps as balancing throughput and stability. Ask: “Fast but broken—is that success?” Use the four questions as the session’s scorecard.

## 5. Works on my machine — 1:15
Tell the ZIP-file story. Nobody knows which version is live; production settings exist in someone’s memory; rollback means searching chat. Key line: “Memory is not a deployment system.”

## 6. SDLC is a loop — 1:15
Walk the loop once. Observation is not the end; telemetry and user feedback become the next plan. DevOps improves the connections across the lifecycle rather than deleting lifecycle stages.

## 7. The queues eat the calendar — 1:00
Point to handoffs, batch size, late checks, and drift. Explain that optimizing one developer while work waits elsewhere does not optimize delivery.

## 8. 2009 changed the conversation — 1:15
Flickr’s Velocity talk showed 10+ deploys per day through Dev/Ops cooperation. Patrick Debois then organized the first DevOpsDays in Ghent in 2009. The movement named an existing pain: development and operations needed shared feedback.

## 9. DevOps is an operating model — 1:15
Use CALMS: culture, automation, lean flow, measurement, sharing. Add ownership. DevOps is not one product, a renamed sysadmin, or permission for uncontrolled production access.

## 10. Before and after — 1:15
Humans still review and decide. Machines execute repetitive checks. Small batches reduce the blast radius and make recovery understandable.

## 11. Five questions — 1:15
Code, Build, Check, Deploy, Observe. Today “build” means validate and package three static files; production systems may compile binaries or create container images.

## 12. Continuous Integration — 1:30
Use a group-assignment analogy: combining everyone’s work on deadline night is painful. CI means integrate small changes frequently and get feedback immediately. A pull request is the review boundary; automation supplies evidence.

## 13. CD has two meanings — 1:30
Continuous delivery keeps every passing version ready for release. Continuous deployment automatically releases passing changes. Today’s merge to `main` triggers continuous deployment.

## 14. X as Code — 1:15
The “as code” pattern stores repeatable intent in a versioned, reviewable form. Not every judgment should be automated, but repeatable definitions should be visible and recoverable.

## 15. Infrastructure as Code — 1:15
Console clicks are useful for learning and inspection. They are weak as the only record of intent. CloudFormation makes resources, settings, and permissions reviewable and repeatable, then removes the environment as one stack.

## 16. Twelve factors — 1:30
The methodology was created by Heroku in 2011 for portable SaaS applications. Do not teach every factor deeply. Highlight one codebase, explicit dependencies, config outside code, build/release/run separation, dev/prod parity, disposable processes, and logs as event streams.

## 17. Principles first — 1:00
Be honest: a static website is not a complete twelve-factor service. It still demonstrates useful habits—one codebase, a declared build, a separated release path, repeatability, and logs.

## 18. Six AWS building blocks — 1:15
Give each service one verb. CloudFormation creates; CodeConnections trusts; CodePipeline coordinates; CodeBuild checks; S3 stores; CloudFront serves. Students should understand jobs before memorizing names.

## 19. PR merge to browser — 2:00
Trace the architecture top to bottom. The source action follows `main`; CodeBuild validates and packages only `demo/`; Deploy extracts that artifact to private S3; CloudFront reads through Origin Access Control and provides HTTPS. GitHub receives no AWS access key.

## 20. Stage contracts — 1:00
Every stage has an input, action, output, and failure signal. That is why pipelines are debuggable. A red stage means a contract failed before the next action.

## 21. Launch once, merge forever — 1:15
The Launch Stack link pre-fills the CloudFormation deployment. AWS still requires the user to review/create the stack and explicitly authorize the pending GitHub connection. Explain that this manual trust handshake is a security feature, not missing automation.

## 22. Live-demo mission — 0:45
Show the audience exactly what success looks like. Ask them to predict green pipeline or plot twist. Switch to the prepared tabs: v1 website, open PR, CodePipeline, CloudFormation Outputs.

## 23. Live demo — 8:00
Follow `docs/demo-runbook.md`:

1. Show v1.0 in the browser.
2. Review the prepared `demo/release-v2` pull request.
3. Point to only version, message, and accent changes.
4. Merge into `main`.
5. Open CodePipeline and connect the execution to the merge commit.
6. Narrate Source, Check, and Deploy; do not watch a spinner silently.
7. Refresh `WebsiteUrl` after all stages are green.
8. Reveal v2.0 and the blue accent.

If anything stalls for 45 seconds, switch to screenshots and continue the story.

## 24. Evidence trail — 1:15
Reconstruct the work: reviewed PR, merge commit, pipeline execution, CodeBuild logs, artifact, S3 deployment, CloudFront response. Key line: “Traceable beats trust me, bro.”

## 25. Production mindset — 1:15
A failed check is useful if it stops bad output early. Recovery should use the same normal path: revert and let the pipeline run. Mention private S3, scoped service roles, costs, and immediate cleanup after the event.

## 26. Small, automated, observable — 4:00
Ask the audience to repeat the three words. Challenge them to fork, deploy, deliberately break, recover, and explain one tiny project. Keep the QR visible for Q&A.

Seed question: “Is DevOps just CI/CD?” Answer: no—CI/CD is one practice inside a broader operating model of ownership, flow, automation, measurement, security, and learning.

## Source notes

- AWS Builders’ Library, [Going faster with continuous delivery](https://aws.amazon.com/builders-library/going-faster-with-continuous-delivery/)
- DevOpsDays, [About DevOpsDays](https://devopsdays.org/about/)
- DORA, [2024 Accelerate State of DevOps](https://dora.dev/research/2024/dora-report/)
- [The Twelve-Factor App](https://12factor.net/)
- AWS CloudFormation, [Quick-create links](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-create-stacks-quick-create-links.html)

External source concepts were summarized and rephrased for licensing compliance.
