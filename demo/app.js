const modal = document.querySelector("#modal");
document.querySelectorAll("[data-book]").forEach((button) => {
  button.addEventListener("click", () => {
    modal.classList.add("show");
    modal.setAttribute("aria-hidden", "false");
  });
});

document.querySelector("#close").addEventListener("click", () => {
  modal.classList.remove("show");
  modal.setAttribute("aria-hidden", "true");
});

document.querySelector("#year").textContent = new Date().getFullYear();
const hour = new Date().getHours();
document.querySelector("#status").textContent = hour >= 8 && hour < 21 ? "● Open today until 9 PM" : "● Urgent line open 24/7";
