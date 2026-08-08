import { cp, mkdir } from "node:fs/promises";

const distDirectory = new URL("../dist/", import.meta.url);

await mkdir(distDirectory, { recursive: true });
await cp(
  new URL("../slides/assets/", import.meta.url),
  new URL("assets/", distDirectory),
  { recursive: true, force: true }
);
