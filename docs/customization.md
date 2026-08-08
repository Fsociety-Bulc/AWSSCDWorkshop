# Customization guide

## Speaker and event details

Edit the cover and final slide in `slides/deck.md`. Replace `FarhanAshrafDev` if you want a full display name, title, company, or social handle.

## Repository URL and QR code

The default QR points to the public beginner CodePipeline branch. Override it when copying the kit:

```bash
REPO_URL="https://github.com/OWNER/REPO" npm run qr
```

Then rebuild all deck formats.

## One-stack setup

The README CloudShell command includes five defaults:

- Public raw URL for `infra/template.yaml`
- GitHub owner
- GitHub repository
- GitHub branch
- Connection name

If you move the kit, update the download URL and parameter values in that command. CloudFormation quick-create does **not** accept a raw GitHub URL as `templateURL`; a literal Launch Stack button requires publishing the template to an S3 HTTPS URL first.

`ConnectionName` must be unique in the selected AWS account. Change it if that account already contains `awsscdworkshop-github`.

## Live website values

The safest stage edit is the release object at the top of `demo/app.js`:

```js
const release = {
  version: "v2.0",
  message: "My first automated AWS deployment!",
  accent: "#38bdf8"
};
```

Keep the edit obvious and avoid changing pipeline or IAM code live.

## Display geometry

The venue canvas is defined in `slides/theme.css`:

```css
/* @size smd 768px 896px */
```

Keep critical text at least 45 pixels from every edge. Confirm physical orientation and scaling at the venue before redesigning the deck.

## Session duration

The notes target 45 minutes.

For 30 minutes:

- Skip slides 6, 8, 10, and 18.
- Reduce the demo to 6 minutes.
- Use a 2-minute Q&A.

For 60 minutes:

- Open `buildspec.yml` after the demo.
- Show a deliberate failed JavaScript syntax check.
- Compare the CloudFormation template with the created Resources tab.
- Demonstrate a Git revert through the same pipeline.
- Keep at least 8 minutes for questions.

## Demo target

The sample is static because it is visual, inexpensive, and understandable without a programming framework. Later projects can target Lambda, ECS, or EC2 while retaining the same source, build, check, deploy, observe, and Infrastructure-as-Code concepts.
