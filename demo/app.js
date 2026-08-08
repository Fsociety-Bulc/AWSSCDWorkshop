const release = {
  version: "v2.0",
  message: "My first automated AWS deployment!",
  accent: "#38bdf8"
};

document.documentElement.style.setProperty("--accent", release.accent);
document.querySelector("#version").textContent = release.version;
document.querySelector("#message").textContent = release.message;
document.querySelector("#status").textContent = "LIVE";
document.querySelector("#timestamp").textContent = `Loaded ${new Date().toLocaleTimeString()}`;
