# Speaker notes — From Code to Cloud

Target: 45 minutes, including an 8-minute live demo and 4-minute Q&A. Audience: approximately 100–120 people; 65% cloud beginners, 15% intermediate students, 15% professionals, and 5% other attendees. Display: portrait SMD, 768×896 pixels.

## 1. From Code to Cloud — 1:00

Welcome everyone and introduce yourself as FarhanAshrafDev. Promise one concrete outcome: by the end, beginners will understand what happens between a Git push and a live AWS deployment. Tell experienced attendees that the demo also covers temporary credentials, least privilege, and recovery.

## 2. Quick show of hands — 1:30

Ask each question and pause. Keep the third question playful, not embarrassing. Use the answers to establish that deployment is a shared problem, not an AWS vocabulary test.

Transition: “Today we will turn deployment from a stressful event into a repeatable system.”

## 3. Cloud in 30 seconds — 1:30

Avoid service names. Explain cloud as renting programmable computing on demand. “Programmable” is the bridge to DevOps: if infrastructure has an API, we can automate it.

## 4. It works on my machine — 2:00

Tell a short story: a developer sends a ZIP file, someone copies it to a server, nobody knows which version is live, and rollback means finding an older ZIP. Ask what happens when the person who remembers the steps is absent.

Key line: “Manual deployments depend on memory; reliable deployments depend on a system.”

## 5. DevOps is a way of working — 2:00

Define DevOps through culture, practices, and automation. Do not describe it as one person running tools. Culture creates shared ownership; practices create feedback; automation makes those practices repeatable.

## 6. Before versus with DevOps — 2:00

Contrast big, rare releases with small, frequent releases. Clarify that automation does not remove humans—it moves human judgment to code review, architecture, and decisions while machines execute checklists.

Key line: “High speed is the result of confidence, not carelessness.”

## 7. CI/CD as a group project — 2:30

Use a familiar analogy. If five students combine a semester project only on the final night, integration hurts. CI means combining work frequently and checking each change. Continuous delivery keeps a verified release ready; continuous deployment automatically releases verified changes.

Do not over-focus on the difference. The central concept is fast, automated feedback.

## 8. One change, five stages — 2:00

Walk downward through the pipeline. Code is the change. Build creates a deployable artifact. Check asks whether it is safe. Deploy releases it consistently. Observe verifies the real user experience. Point out that the loop returns to code.

## 9. AWS toolbox — 2:30

Tell beginners they do not need to memorize the list. Explain that multiple tools can implement the same practice. Today GitHub Actions orchestrates, S3 stores the site, CloudFront delivers it, IAM controls access, and CloudFormation defines infrastructure.

For professionals: mention that the same pattern can target Lambda, ECS, EKS, or EC2.

## 10. Architecture — 2:30

Trace the arrows slowly. GitHub Actions does not store a permanent AWS access key. It presents an OIDC identity token; AWS validates the repository and branch and returns temporary credentials. The S3 bucket remains private. CloudFront is the public front door.

Security line: “Trust one repository, one branch, one role, for one purpose.”

## 11. Demo mission — 1:00

Set expectations before changing windows. Ask the audience to predict whether the pipeline succeeds. Explain that you will change only `demo/app.js`, push it, inspect the workflow, and refresh the website.

## 12. Live demo — 8:00

Follow `docs/demo-runbook.md`. Keep browser and terminal zoom at 150–175%. Do not type IAM policy or workflow YAML live.

Narration sequence:
1. Show the existing v1.0 site.
2. Open `demo/app.js`; change version, message, and accent.
3. Commit and push the prepared change.
4. Open the GitHub Actions run. Point out validation and OIDC steps.
5. While it runs, recap the architecture—do not wait silently.
6. Open the run summary when green.
7. Refresh the CloudFront URL and reveal v2.0.
8. State that no AWS access key exists in GitHub secrets.

If anything stalls for 45 seconds, switch to the fallback recording or screenshots and continue the story.

## 13. What just happened? — 2:00

Return to slides and reconstruct the invisible automation. Reinforce that the workflow is a version-controlled checklist. Every team member gets the same process.

## 14. What if a check fails? — 2:00

A pipeline should stop before deployment when a required check fails. Explain fix-forward versus rollback without going deep into deployment strategies. Mention S3 versioning as a recovery aid in this demo.

## 15. DevSecOps — 2:00

Explain OIDC in plain language: GitHub proves who it is, AWS issues a short-lived badge, and the badge expires. Least privilege limits the blast radius. Git and AWS logs give traceability.

Avoid opening credentials, environment dumps, or account details on stage.

## 16. Operate the lifecycle — 2:00

CloudFormation makes infrastructure reproducible. Observability tells us whether the deployment works for users. Rollback restores service. Feedback turns an incident into the next improvement.

## 17. First 30 days — 3:00

Give beginners an achievable path. Emphasize one small portfolio project instead of collecting tools. Suggested project: static portfolio on S3/CloudFront, deployed by GitHub Actions with OIDC, infrastructure in CloudFormation, and a simple uptime check.

Invite intermediate attendees to add preview environments or a container target.

## 18. Three takeaways — 1:30

Ask the audience to say the three words with you: small, automated, observable. Connect each word to risk, repeatability, and feedback.

## 19. Questions and repository — 4:00

Invite attendees to scan the QR code. Explain that the repository includes the deck, source, AWS template, deployment workflow, cleanup script, and fallback plan. Take questions. If no question comes immediately, seed one: “Should every passing commit deploy automatically?” Answer: it depends on risk and governance; continuous delivery can retain approval gates.
