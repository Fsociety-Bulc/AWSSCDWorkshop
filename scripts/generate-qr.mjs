import { mkdir } from "node:fs/promises";
import { fileURLToPath } from "node:url";
import QRCode from "qrcode";

const defaultUrl = "https://github.com/FarhanAshrafDev/devops-on-aws-community-day";
const url = process.env.REPO_URL || defaultUrl;
const assetDirectory = new URL("../slides/assets/", import.meta.url);
const outputFile = fileURLToPath(new URL("repo-qr.svg", assetDirectory));

await mkdir(assetDirectory, { recursive: true });
await QRCode.toFile(outputFile, url, {
  type: "svg",
  color: { dark: "#08111f", light: "#ffffff" },
  margin: 2,
  width: 420
});

console.log(`Generated slides/assets/repo-qr.svg for ${url}`);
