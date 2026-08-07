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
<p class="speaker">FarhanAshrafDev · Live session</p>

---

# Quick show<br>of hands

<div class="stack">
  <div class="card"><h3>01</h3><p>Who has built an application?</p></div>
  <div class="card"><h3>02</h3><p>Who has deployed one to the internet?</p></div>
  <div class="card"><h3>03</h3><p>Who has accidentally broken production?</p></div>
</div>

<p class="small muted" style="margin-top: 34px">Today, everyone gets from the first question to the second—safely.</p>

---

<p class="kicker">Cloud in 30 seconds</p>

# Rent computing.<br>Use it on demand.

<div class="metric"><strong>0</strong><span>servers to buy before your first deployment</span></div>

<div class="grid-2">
  <div class="card"><h3>Elastic</h3><p>Grow or shrink when demand changes.</p></div>
  <div class="card"><h3>Programmable</h3><p>Create infrastructure through APIs and code.</p></div>
</div>

---

<p class="kicker">The real problem</p>

# “It works on<br>my machine.”

<p class="quote">How does every change reach users <span class="orange">quickly</span>, <span class="green">safely</span>, and <span class="blue">repeatedly</span>?</p>

<p class="small muted" style="margin-top: 54px">Manual deployments depend on memory. Reliable deployments depend on a system.</p>

---

<p class="kicker">DevOps is not a job title</p>

# DevOps is a<br>way of working

<div class="stack">
  <div class="card"><h3>Culture</h3><p>Developers and operations own outcomes together.</p></div>
  <div class="card"><h3>Practices</h3><p>Small changes, feedback, measurement, learning.</p></div>
  <div class="card"><h3>Automation</h3><p>Machines repeat the boring, risky steps.</p></div>
</div>

---

# Before vs.<br>with DevOps

<div class="grid-2">
  <div class="card">
    <h3 class="red">Manual</h3>
    <p>Big releases</p><p>Hero debugging</p><p>Fear of Friday</p><p>Slow feedback</p>
  </div>
  <div class="card">
    <h3 class="green">Automated</h3>
    <p>Small releases</p><p>Repeatable checks</p><p>Easy rollback</p><p>Fast feedback</p>
  </div>
</div>

<p class="big center" style="margin-top: 46px">Speed comes from <span class="orange">safety</span>.</p>

---

<p class="kicker">CI/CD as a group project</p>

# Integrate early.<br>Deliver often.

<div class="flow">
  <div class="step"><span class="orange">CI</span> · Combine work frequently</div>
  <div class="step">Build and check every change</div>
  <div class="step"><span class="blue">CD</span> · Keep it ready to release</div>
  <div class="step">Deploy with a repeatable process</div>
</div>

---

<p class="kicker">The delivery loop</p>

# One change.<br>Five stages.

<div class="flow">
  <div class="step">1 · CODE</div>
  <div class="step">2 · BUILD</div>
  <div class="step">3 · CHECK</div>
  <div class="step">4 · DEPLOY</div>
  <div class="step">5 · OBSERVE</div>
</div>

---

<p class="kicker">One possible AWS toolbox</p>

# Match tools<br>to stages

<div class="stack">
  <div class="card"><h3>Source</h3><p>GitHub · CodeCommit</p></div>
  <div class="card"><h3>Build and delivery</h3><p>GitHub Actions · CodeBuild · CodePipeline</p></div>
  <div class="card"><h3>Run</h3><p>S3 · Lambda · ECS · EKS · EC2</p></div>
  <div class="card"><h3>Observe</h3><p>CloudWatch · X-Ray · CloudTrail</p></div>
</div>

<p class="tiny muted" style="margin-top: 18px">The practice matters more than the product list.</p>

---

<p class="kicker">Today’s architecture</p>

# Git push to<br>live website

<div class="arch">
  <div class="arch-node">GITHUB REPOSITORY</div>
  <div class="arch-arrow">TO</div>
  <div class="arch-node">GITHUB ACTIONS</div>
  <div class="arch-arrow">TEMPORARY IDENTITY VIA OIDC</div>
  <div class="arch-node">PRIVATE AMAZON S3</div>
  <div class="arch-arrow">SECURE CONTENT DELIVERY</div>
  <div class="arch-node">AMAZON CLOUDFRONT</div>
</div>

---

<p class="kicker">Demo mission</p>

# Change one line.<br>Ship it live.

<ul class="checklist">
  <li>Edit the release message</li>
  <li>Commit and push</li>
  <li>Watch automated deployment</li>
  <li>Refresh the live website</li>
  <li>Prove no AWS key was stored</li>
</ul>

<p class="small muted" style="margin-top: 34px">Audience prediction: will the pipeline go green?</p>

---

<!-- _class: live -->

<p class="kicker">No slides for the next 8 minutes</p>

# LIVE<br><span class="orange">DEMO</span>

<p>Code / Commit / Pipeline / AWS</p>

---

<p class="kicker">What just happened?</p>

# The computer did<br>the checklist

<div class="flow">
  <div class="step">GitHub detected the commit</div>
  <div class="step">The workflow checked its inputs</div>
  <div class="step">OIDC issued temporary access</div>
  <div class="step">Files synced to private S3</div>
  <div class="step">CloudFront refreshed the website</div>
</div>

---

<p class="kicker">What if a check fails?</p>

# Stop the<br>conveyor belt.

<p class="quote">A failed pipeline is <span class="green">good news early</span>, not bad news in production.</p>

<div class="grid-2" style="margin-top: 48px">
  <div class="card"><h3>Fix forward</h3><p>Correct the change and redeploy.</p></div>
  <div class="card"><h3>Roll back</h3><p>Restore the last known-good version.</p></div>
</div>

---

<p class="kicker">DevSecOps</p>

# Security travels<br>with the code

<div class="stack">
  <div class="card"><h3>No permanent AWS keys</h3><p>OIDC creates short-lived credentials.</p></div>
  <div class="card"><h3>Least privilege</h3><p>The role can update only this site.</p></div>
  <div class="card"><h3>Trace every change</h3><p>Git history and AWS logs preserve evidence.</p></div>
</div>

---

<p class="kicker">Deployment is not the finish line</p>

# Operate the<br>whole lifecycle

<div class="grid-2">
  <div class="card"><h3>Infrastructure as Code</h3><p>Recreate environments reliably.</p></div>
  <div class="card"><h3>Observability</h3><p>Know what users experience.</p></div>
  <div class="card"><h3>Rollback</h3><p>Recover quickly from failure.</p></div>
  <div class="card"><h3>Feedback</h3><p>Improve the next small change.</p></div>
</div>

---

<p class="kicker">Your first 30 days</p>

# Learn by<br>shipping

<div class="flow">
  <div class="step">WEEK 1 · Git + Linux basics</div>
  <div class="step">WEEK 2 · AWS IAM, S3, CloudFront</div>
  <div class="step">WEEK 3 · CI/CD + containers</div>
  <div class="step">WEEK 4 · IaC + monitoring</div>
</div>

<p class="small muted" style="margin-top: 28px">Build one tiny project. Automate it. Break it. Recover it. Explain it.</p>

---

<p class="kicker">Remember only three things</p>

# Small.<br>Automated.<br>Observable.

<div class="stack" style="margin-top: 54px">
  <div class="card"><h3>01 · Small changes</h3><p>Reduce risk and simplify recovery.</p></div>
  <div class="card"><h3>02 · Automated path</h3><p>Make delivery repeatable.</p></div>
  <div class="card"><h3>03 · Fast feedback</h3><p>Learn before users suffer.</p></div>
</div>

---

<p class="kicker center">Slides · code · AWS template · runbook</p>

# Thank you.<br><span class="orange">Questions?</span>

<img class="qr" src="assets/repo-qr.svg" alt="QR code for session repository" />

<p class="center small"><strong>github.com/FarhanAshrafDev/<br>devops-on-aws-community-day</strong></p>
<p class="center tiny muted">Source references and cleanup instructions are in the repository.</p>
