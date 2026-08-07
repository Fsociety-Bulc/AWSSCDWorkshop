# Customization guide

## Speaker and event details

Edit the first and final slides in `slides/deck.md`. Replace `FarhanAshrafDev` if you want your full display name, job title, company, or social handle shown.

## Repository URL and QR code

The default URL is `https://github.com/FarhanAshrafDev/devops-on-aws-community-day`. To use another URL:

```bash
REPO_URL="https://github.com/OWNER/REPO" npm run qr
```

Then rebuild the deck.

## Display geometry

The venue specification is defined in `slides/theme.css`:

```css
/* @size smd 768px 896px */
```

Keep critical text at least 45 pixels from each edge. The current theme uses larger safe margins. If the hardware rotates or scales the signal, confirm orientation at the venue before changing the deck.

## Session duration

The current notes target 45 minutes. For 30 minutes:

- Skip slides 6, 9, and 16.
- Reduce the demo to 6 minutes.
- Use a 2-minute Q&A.

For 60 minutes:

- Add a short workflow YAML walkthrough after the demo.
- Show the CloudFormation trust policy.
- Demonstrate a failed validation or rollback.
- Keep at least 8 minutes for questions.

## Demo target

The sample uses a static site because it is visual, inexpensive, and understandable to cloud beginners. The same source/build/check/deploy/observe story can later target Lambda, ECS, EKS, or EC2 without changing the core teaching narrative.
