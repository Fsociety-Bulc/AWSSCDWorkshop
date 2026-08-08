---
marp: true
theme: aws-community
size: smd
paginate: true
html: true
---

<!-- _class: cover -->

<p class="kicker">AWS Student Community Day · Islamabad</p>

# FROM CODE<br><span class="orange">TO CLOUD</span>

<p class="subtitle">Your first DevOps pipeline on AWS</p>
<p class="speaker">FarhanAshrafDev · Beginner session + live demo</p>

---

<p class="kicker">Cloud in 30 seconds</p>

# Rent building blocks.<br>Control them by API.

<div class="metric"><strong>0</strong><span>servers to buy before your first deployment</span></div>

<div class="grid-2">
  <div class="card"><h3>On demand</h3><p>Create what you need, when you need it.</p></div>
  <div class="card"><h3>Programmable</h3><p>Use code instead of repeating console clicks.</p></div>
</div>

---

# Quick show<br>of hands

<div class="stack">
  <div class="card"><h3>01</h3><p>Who has written any code?</p></div>
  <div class="card"><h3>02</h3><p>Who has deployed it to the internet?</p></div>
  <div class="card"><h3>03</h3><p>Who knows what DevOps actually means?</p></div>
</div>

<p class="small muted" style="margin-top: 34px">No previous DevOps knowledge is required today.</p>

---

<p class="kicker">The problem before the tools</p>

# “It works on<br>my machine.”

<p class="quote">How does every change reach users <span class="orange">quickly</span>, <span class="green">safely</span>, and <span class="blue">repeatedly</span>?</p>

<p class="small muted" style="margin-top: 52px">Manual deployment depends on memory. Reliable delivery depends on a system.</p>

---

<p class="kicker">Dev + Ops + feedback</p>

# DevOps is a<br>way of working

<div class="stack">
  <div class="card"><h3>Culture</h3><p>Builders and operators own the result together.</p></div>
  <div class="card"><h3>Practices</h3><p>Small changes, review, measurement, learning.</p></div>
  <div class="card"><h3>Automation</h3><p>Machines repeat the boring and risky steps.</p></div>
</div>

---

# Before vs.<br>with DevOps

<div class="grid-2">
  <div class="card">
    <h3 class="red">Manual</h3>
    <p>Large releases</p><p>Different steps</p><p>Slow feedback</p><p>Hero debugging</p>
  </div>
  <div class="card">
    <h3 class="green">Repeatable</h3>
    <p>Small releases</p><p>Automated checks</p><p>Fast feedback</p><p>Shared ownership</p>
  </div>
</div>

<p class="big center" style="margin-top: 44px">Speed comes from <span class="orange">confidence</span>.</p>

---

<p class="kicker">The DevOps loop</p>

# One change.<br>Five questions.

<div class="flow">
  <div class="step">1 · CODE — what changed?</div>
  <div class="step">2 · BUILD — what will we ship?</div>
  <div class="step">3 · CHECK — is it safe enough?</div>
  <div class="step">4 · DEPLOY — how does it go live?</div>
  <div class="step">5 · OBSERVE — did it work?</div>
</div>

---

<p class="kicker">CI/CD without the alphabet soup</p>

# Integrate early.<br>Deliver repeatedly.

<div class="stack">
  <div class="card"><h3>Continuous Integration</h3><p>Combine small changes and check each one.</p></div>
  <div class="card"><h3>Continuous Delivery</h3><p>Keep a checked version ready to release.</p></div>
  <div class="card"><h3>Continuous Deployment</h3><p>Automatically release a change that passes.</p></div>
</div>

<p class="small muted" style="margin-top: 24px">The goal is fast feedback—not a fancy pipeline diagram.</p>

---

<p class="kicker">Infrastructure as Code</p>

# The environment<br>is also code

<div class="stack">
  <div class="card"><h3>Application code</h3><p>What users see and use.</p></div>
  <div class="card"><h3>Pipeline code</h3><p>How every change is checked and delivered.</p></div>
  <div class="card"><h3>Infrastructure code</h3><p>Which AWS resources, permissions, and settings exist.</p></div>
</div>

<p class="small muted" style="margin-top: 24px">Today, one CloudFormation template describes the whole AWS environment.</p>

---

<p class="kicker">ClickOps vs. Infrastructure as Code</p>

# One template.<br>Same result.

<div class="grid-2">
  <div class="card"><h3 class="red">Console memory</h3><p>Click 30 times</p><p>Forget one setting</p><p>Hard to review</p><p>Hard to repeat</p></div>
  <div class="card"><h3 class="green">CloudFormation</h3><p>Version in Git</p><p>Review the diff</p><p>Deploy consistently</p><p>Delete as a stack</p></div>
</div>

<p class="big center" style="margin-top: 38px">The template is our <span class="orange">blueprint</span>.</p>

---

<p class="kicker">Skills required</p>

# Start small.<br>Learn in layers.

<div class="grid-2">
  <div class="card"><h3>Start today</h3><p>Basic Git</p><p>Read simple code</p><p>Curiosity</p><p>Willingness to break things</p></div>
  <div class="card"><h3>Build next</h3><p>Linux basics</p><p>AWS + IAM</p><p>CI/CD</p><p>IaC + monitoring</p></div>
</div>

<p class="small muted" style="margin-top: 30px">Not required: Docker, Kubernetes, EKS, Argo CD, or AI.</p>

---

<p class="kicker">Only six AWS building blocks today</p>

# Each tool has<br>one simple job

<div class="grid-2">
  <div class="card"><h3>CloudFormation</h3><p>Create the environment</p></div>
  <div class="card"><h3>CodeConnections</h3><p>Connect GitHub once</p></div>
  <div class="card"><h3>CodePipeline</h3><p>Coordinate the stages</p></div>
  <div class="card"><h3>CodeBuild</h3><p>Check and package</p></div>
  <div class="card"><h3>Amazon S3</h3><p>Store the webpage</p></div>
  <div class="card"><h3>CloudFront</h3><p>Deliver it securely</p></div>
</div>

---

<p class="kicker">Today’s architecture</p>

# Git push to<br>live website

<div class="arch">
  <div class="arch-node">GITHUB PUSH</div>
  <div class="arch-arrow">↓ CODECONNECTIONS</div>
  <div class="arch-node">CODEPIPELINE · SOURCE / CHECK / DEPLOY</div>
  <div class="arch-arrow">↓ CHECKED WEBSITE FILES</div>
  <div class="arch-node">PRIVATE AMAZON S3</div>
  <div class="arch-arrow">↓ SECURE DELIVERY</div>
  <div class="arch-node">CLOUDFRONT → WEB BROWSER</div>
</div>

---

<p class="kicker">One stack + one human handshake</p>

# Setup once.<br>Push forever.

<div class="flow">
  <div class="step">1 · Deploy the CloudFormation stack</div>
  <div class="step">2 · Authorize the pending GitHub connection</div>
  <div class="step">3 · Push changes and watch the pipeline</div>
</div>

<div class="grid-2" style="margin-top: 30px">
  <div class="card"><h3>Human decides</h3><p>Which repository AWS may access.</p></div>
  <div class="card"><h3>Automation repeats</h3><p>Every later source, check, and deploy step.</p></div>
</div>

---

<p class="kicker">Live-demo mission</p>

# Change three values.<br>Ship them live.

<ul class="checklist">
  <li>Show version 1 in the browser</li>
  <li>Edit message, version, and color</li>
  <li>Commit and push to GitHub</li>
  <li>Watch Source → Check → Deploy</li>
  <li>Refresh and reveal version 2</li>
</ul>

<p class="small muted" style="margin-top: 30px">Audience prediction: will all three stages go green?</p>

---

<!-- _class: live -->

<p class="kicker">No slides for the next 8 minutes</p>

# LIVE<br><span class="orange">DEMO</span>

<p>Change / Commit / Pipeline / Website</p>

---

<p class="kicker">What just happened?</p>

# The pipeline did<br>the checklist

<div class="flow">
  <div class="step">CodeConnections detected the GitHub push</div>
  <div class="step">CodePipeline downloaded the commit</div>
  <div class="step">CodeBuild checked and packaged demo/</div>
  <div class="step">The deploy stage updated private S3</div>
  <div class="step">CloudFront served the new page</div>
</div>

---

<p class="kicker">Failure and security are part of DevOps</p>

# Stop early.<br>Limit access.

<div class="grid-2">
  <div class="card"><h3>Check fails?</h3><p>Deployment stops before users see the change.</p></div>
  <div class="card"><h3>Need recovery?</h3><p>Revert the Git commit and run the same path.</p></div>
  <div class="card"><h3>GitHub access?</h3><p>One approved app connection—no access key in Git.</p></div>
  <div class="card"><h3>AWS access?</h3><p>Service roles receive only the permissions they need.</p></div>
</div>

<p class="small muted" style="margin-top: 26px">A red pipeline is useful feedback delivered early.</p>

---

<p class="kicker">Your first 30 days</p>

# Learn by<br>shipping

<div class="flow">
  <div class="step">WEEK 1 · Git + Linux basics</div>
  <div class="step">WEEK 2 · AWS IAM, S3, and networking</div>
  <div class="step">WEEK 3 · CodeBuild + CodePipeline</div>
  <div class="step">WEEK 4 · CloudFormation + CloudWatch</div>
</div>

<p class="small muted" style="margin-top: 28px">Build one tiny project. Automate it. Break it. Recover it. Explain it.</p>

---

<p class="kicker">Remember only three things</p>

# Small.<br>Automated.<br>Observable.

<div class="stack" style="margin-top: 50px">
  <div class="card"><h3>01 · Small changes</h3><p>Reduce risk and simplify recovery.</p></div>
  <div class="card"><h3>02 · Automated path</h3><p>Make delivery repeatable.</p></div>
  <div class="card"><h3>03 · Fast feedback</h3><p>Learn before users suffer.</p></div>
</div>

---

<p class="kicker center">Slides · webpage · one-stack template · runbook</p>

# Thank you.<br><span class="orange">Questions?</span>

<img class="qr" src="assets/repo-qr.svg" alt="QR code for session repository" />

<p class="center small"><strong>Fsociety-Bulc / AWSSCDWorkshop<br>merge a PR, watch it deploy</strong></p>
<p class="center tiny muted">Deploy link, cleanup, and rehearsal steps are in the repository.</p>
