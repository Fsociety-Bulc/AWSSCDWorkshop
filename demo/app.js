const status = document.querySelector("#status");
const hour = new Date().getHours();
status.textContent = hour >= 8 && hour < 20 ? "● Open today until 8 PM" : "● Opens tomorrow at 8 AM";
document.querySelector("#year").textContent = new Date().getFullYear();

const toast = document.querySelector("#toast");
document.querySelectorAll("[data-book]").forEach((button) => {
  button.addEventListener("click", () => {
    toast.classList.add("show");
    window.setTimeout(() => toast.classList.remove("show"), 3200);
  });
});
