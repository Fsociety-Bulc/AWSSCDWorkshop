const release = {
  version: "v1.0",
  message: "Ship with confidence.",
  accent: "#ff9900"
};

document.documentElement.style.setProperty("--accent", release.accent);
document.querySelector("#version").textContent = release.version;
document.querySelector("#message").textContent = release.message;
document.querySelector("#status").textContent = "LIVE";
document.querySelector("#timestamp").textContent = `Loaded ${new Date().toLocaleTimeString()}`;
