const btnPrev = document.querySelector(".btn-prev");
const btnNext = document.querySelector(".btn-next");
let index = 1;
btnNext.addEventListener("click", () => {
  console.log(index);
  index++;
});
