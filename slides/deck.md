---
marp: true
theme: aws-community
size: smd
paginate: true
html: true
---

<p class="kicker">The hidden delivery tax</p>

# <span class="orange">14 DAYS</span><br>mostly waiting.

<div class="number-grid">
  <div class="card"><h3>1.5 days</h3><p>writing the change</p></div>
  <div class="card"><h3>&lt; 1 hour</h3><p>build + deploy work</p></div>
  <div class="card"><h3>~14 days</h3><p>queues, handoffs, tests</p></div>
</div>

<p class="big center">The bottleneck was not typing.</p>
<p class="source">Historical Amazon example · AWS Builders’ Library, “Going faster with continuous delivery”</p>

---

<p class="kicker">Wait… they shipped how often?</p>

# ONE DEPLOY<br>EVERY <span class="blue">11.7 SEC</span>

<div class="metric"><strong>~23K</strong><span>production deployments per day across Amazon</span></div>

<div class="card"><h3>Context check</h3><p>Historical 2011 aggregate—not one app, not a current AWS-wide rate. Many autonomous teams + many services + automation.</p></div>

<p class="source">Historical figure attributed to John Jenkins’ Velocity 2011 talk</p>

---

<!-- _class: cover -->

<p class="kicker">AWS Student Community Day · Islamabad</p>

# FROM CODE<br><span class="orange">TO CLOUD</span>

<p class="subtitle">Merge one PR. Watch AWS ship the website.</p>
<p class="speaker">FarhanAshrafDev · DevOps without the corporate yapping</p>

---

<p class="kicker">The mission</p>

# Make change<br>boring—in a good way.

<div class="grid-2">
  <div class="card"><h3>Fast</h3><p>How quickly can value reach a user?</p></div>
  <div class="card"><h3>Safe</h3><p>How often does change create failure?</p></div>
  <div class="card"><h3>Repeatable</h3><p>Can the same path run every time?</p></div>
  <div class="card"><h3>Recoverable</h3><p>How quickly can we learn and restore?</p></div>
</div>

<p class="source">Speed and stability belong together · DORA software-delivery research</p>

---

<p class="kicker">The problem statement</p>

# “Works on my<br>machine.” Cool. Now what?

<div class="flow">
  <div class="step">ZIP the code and send it in chat</div>
  <div class="step">Someone remembers the console clicks</div>
  <div class="step">Production is somehow “different”</div>
  <div class="step">Rollback = find yesterday’s ZIP</div>
</div>

<p class="big center">Memory is not a deployment system.</p>

---

<p class="kicker">Software Development Life Cycle</p>

# SDLC is a loop,<br>not a finish line.

<div class="loop">
  <span>PLAN</span><b>→</b><span>CODE</span><b>→</b><span>BUILD</span><b>→</b><span>TEST</span><b>→</b><span>RELEASE</span><b>→</b><span>DEPLOY</span><b>→</b><span>OPERATE</span><b>→</b><span>OBSERVE</span>
</div>

<p class="quote">Observation becomes the next plan.</p>

---

<p class="kicker">Where delivery gets stuck</p>

# The queues eat<br>the calendar.

<div class="grid-2">
  <div class="card"><h3>Handoffs</h3><p>“My part is done.”</p></div>
  <div class="card"><h3>Big batches</h3><p>Too much changes at once.</p></div>
  <div class="card"><h3>Late checks</h3><p>Feedback arrives after context is gone.</p></div>
  <div class="card"><h3>Drift</h3><p>Every environment has a secret recipe.</p></div>
</div>

<p class="big center">Optimize the <span class="orange">flow</span>, not one person.</p>

---

<p class="kicker">How the movement started</p>

# 2009 changed<br>the conversation.

<div class="timeline">
  <div><strong>Velocity 2009</strong><span>Flickr: “10+ deploys per day” through Dev + Ops cooperation</span></div>
  <div><strong>Oct 2009</strong><span>Patrick Debois organizes the first DevOpsDays in Ghent</span></div>
  <div><strong>Today</strong><span>Cloud APIs make environments and delivery paths programmable</span></div>
</div>

<p class="source">History: devopsdays.org/about · Flickr Velocity 2009 talk</p>

---

<p class="kicker">Dev + Ops + everyone responsible</p>

# DevOps is an<br>operating model.

<div class="pill-grid">
  <span>CULTURE</span><span>AUTOMATION</span><span>LEAN FLOW</span><span>MEASUREMENT</span><span>SHARING</span><span>OWNERSHIP</span>
</div>

<p class="quote">Not a tool. Not a job title. Not “give prod access to everyone.”</p>

---

<p class="kicker">Before vs. after DevOps</p>

# Same humans.<br>Better system.

<div class="grid-2">
  <div class="card"><h3 class="red">Before</h3><p>Silos</p><p>Large releases</p><p>Manual checklists</p><p>Slow blame loops</p></div>
  <div class="card"><h3 class="green">After</h3><p>Shared outcomes</p><p>Small changes</p><p>Automated evidence</p><p>Fast learning loops</p></div>
</div>

<p class="big center">Speed comes from <span class="orange">confidence</span>.</p>

---

<p class="kicker">The DevOps feedback loop</p>

# One change.<br>Five questions.

<div class="flow">
  <div class="step">CODE · what changed?</div>
  <div class="step">BUILD · what will we ship?</div>
  <div class="step">CHECK · is the evidence good?</div>
  <div class="step">DEPLOY · how does it go live?</div>
  <div class="step">OBSERVE · did it work?</div>
</div>

---

<p class="kicker">CI · Continuous Integration</p>

# Merge small.<br>Check immediately.

<div class="arch">
  <div class="arch-node">SMALL BRANCH + PULL REQUEST</div>
  <div class="arch-arrow">↓ MERGE OFTEN</div>
  <div class="arch-node">BUILD + TEST + REVIEW EVIDENCE</div>
  <div class="arch-arrow">↓ FAST FEEDBACK</div>
  <div class="arch-node">MAIN STAYS HEALTHY</div>
</div>

<p class="small muted center">CI answers: “Can this change safely join everyone else’s work?”</p>

---

<p class="kicker">CD has two meanings</p>

# Ready to release<br>vs. released.

<div class="stack">
  <div class="card"><h3>Continuous Delivery</h3><p>Every passing change is kept releasable; a human may approve production.</p></div>
  <div class="card"><h3>Continuous Deployment</h3><p>Every passing change is automatically released to production.</p></div>
</div>

<p class="quote">Today: merge to <code>main</code> → automatic deployment.</p>

---

<p class="kicker">X as Code</p>

# Put repeatable<br>intent in Git.

<div class="pill-grid">
  <span>APP AS CODE</span><span>TESTS AS CODE</span><span>PIPELINE AS CODE</span><span>INFRA AS CODE</span><span>CONFIG AS CODE</span><span>POLICY AS CODE</span><span>DOCS AS CODE</span><span>RUNBOOKS AS CODE</span>
</div>

<p class="small muted center">Version it · review the diff · automate it · recover from history</p>

---

<p class="kicker">Infrastructure as Code</p>

# Stop clicking.<br>Start describing.

<div class="grid-2">
  <div class="card"><h3 class="red">ClickOps</h3><p>Console memory</p><p>Hidden drift</p><p>Hard to reproduce</p><p>Hard to clean up</p></div>
  <div class="card"><h3 class="green">CloudFormation</h3><p>Blueprint in Git</p><p>Reviewable diff</p><p>Repeatable stack</p><p>Delete together</p></div>
</div>

<p class="big center">Intent → API → <span class="orange">consistent state</span></p>

---

<p class="kicker">Cloud-native design vocabulary</p>

# The 12-factor app<br>in one screen.

<div class="factor-grid">
  <span>01 Codebase</span><span>02 Dependencies</span><span>03 Config</span><span>04 Backing services</span><span>05 Build / release / run</span><span>06 Processes</span><span>07 Port binding</span><span>08 Concurrency</span><span>09 Disposability</span><span>10 Dev/prod parity</span><span>11 Logs</span><span>12 Admin processes</span>
</div>

<p class="source">Methodology created by Heroku in 2011 · 12factor.net</p>

---

<p class="kicker">Do not cargo-cult the checklist</p>

# Principles first.<br>Tools second.

<div class="stack">
  <div class="card"><h3>One codebase</h3><p>Git records the source of truth.</p></div>
  <div class="card"><h3>Build / release / run</h3><p>The pipeline separates checked artifacts from runtime.</p></div>
  <div class="card"><h3>Parity + logs</h3><p>Repeat the path; keep visible evidence.</p></div>
</div>

<p class="small muted center">Our static site is not a full SaaS app. It teaches the delivery habits.</p>

---

<p class="kicker">Six AWS building blocks</p>

# Six tools.<br>One job each.

<div class="grid-2">
  <div class="card"><h3>CloudFormation</h3><p>Create the system</p></div>
  <div class="card"><h3>CodeConnections</h3><p>Trust GitHub once</p></div>
  <div class="card"><h3>CodePipeline</h3><p>Coordinate stages</p></div>
  <div class="card"><h3>CodeBuild</h3><p>Check + package</p></div>
  <div class="card"><h3>Amazon S3</h3><p>Store private files</p></div>
  <div class="card"><h3>CloudFront</h3><p>Serve HTTPS globally</p></div>
</div>

---

<p class="kicker">Today’s architecture</p>

# PR merge to<br>live browser.

<div class="arch compact">
  <div class="arch-node">GITHUB PR → MERGE TO MAIN</div>
  <div class="arch-arrow">↓ CODECONNECTIONS</div>
  <div class="arch-node">CODEPIPELINE · SOURCE</div>
  <div class="arch-arrow">↓</div>
  <div class="arch-node">CODEBUILD · CHECK + PACKAGE</div>
  <div class="arch-arrow">↓</div>
  <div class="arch-node">DEPLOY → PRIVATE S3 → CLOUDFRONT</div>
</div>

<p class="small muted center">Commit = record · Pipeline = checklist · AWS = runtime</p>

---

<p class="kicker">Every stage has a contract</p>

# No magic.<br>Inputs and outputs.

<div class="stack">
  <div class="card"><h3>SOURCE</h3><p>main commit → source artifact</p></div>
  <div class="card"><h3>CHECK</h3><p>source → validated website artifact + logs</p></div>
  <div class="card"><h3>DEPLOY</h3><p>website artifact → private S3 objects</p></div>
</div>

<p class="small muted center">A failed contract stops the next stage.</p>

---

<p class="kicker">One stack + one trust decision</p>

# Launch once.<br>Merge forever.

<div class="flow">
  <div class="step">1 · Launch the CloudFormation stack</div>
  <div class="step">2 · Authorize the pending GitHub connection</div>
  <div class="step">3 · Merge PRs and watch deployment</div>
</div>

<div class="grid-2" style="margin-top: 28px">
  <div class="card"><h3>Human gate</h3><p>Choose which repository AWS may read.</p></div>
  <div class="card"><h3>Machine loop</h3><p>Repeat Source, Check, Deploy.</p></div>
</div>

---

<p class="kicker">Live-demo mission</p>

# Merge v2.<br>Watch it move.

<ul class="checklist">
  <li>Show the v1 website</li>
  <li>Review a three-line PR</li>
  <li>Merge it into <code>main</code></li>
  <li>Watch Source → Check → Deploy</li>
  <li>Refresh and reveal v2</li>
</ul>

<p class="big center">Chat: green pipeline or plot twist?</p>

---

<!-- _class: live -->

<p class="kicker">No slides for the next 8 minutes</p>

# PR → MERGE<br><span class="orange">→ LIVE</span>

<p>Review / Pipeline / Evidence / Website</p>

---

<p class="kicker">What just happened?</p>

# Follow the<br>evidence trail.

<div class="flow">
  <div class="step">PR review + merge commit</div>
  <div class="step">Pipeline execution tied to that commit</div>
  <div class="step">CodeBuild checks + packaged artifact</div>
  <div class="step">Private S3 deployment + CloudFront response</div>
</div>

<p class="small muted center">Traceable beats “trust me, bro.”</p>

---

<p class="kicker">Production mindset</p>

# Red can be<br>useful feedback.

<div class="grid-2">
  <div class="card"><h3>Fail early</h3><p>Stop before users see bad output.</p></div>
  <div class="card"><h3>Recover normally</h3><p>Revert through the same path.</p></div>
  <div class="card"><h3>Limit access</h3><p>Private S3 + scoped IAM roles.</p></div>
  <div class="card"><h3>Clean up</h3><p>Delete the stack; low cost ≠ zero cost.</p></div>
</div>

<p class="small muted center">No AWS key in GitHub. One approved app connection.</p>

---

<p class="kicker center">Your challenge: fork · deploy · break · recover · explain</p>

# SMALL.<br>AUTOMATED.<br><span class="orange">OBSERVABLE.</span>

<img class="qr" src="assets/repo-qr.svg" alt="QR code for workshop repository" />

<p class="center small"><strong>Fsociety-Bulc / AWSSCDWorkshop</strong></p>
<p class="center tiny muted">One-stack template · PR demo · slides · runbook · cleanup</p>
