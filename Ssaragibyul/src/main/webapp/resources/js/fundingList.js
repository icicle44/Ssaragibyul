/*
const list = document.querySelector(".grid");
const listItems = list.querySelectorAll("li");
const ajaxLoadMoreBtn = document.querySelector(".ajax-load-more");

let k = 6;
let j = 10;

ajaxLoadMoreBtn.addEventListener("click", function () {
  let range = `li:nth-child(n+${k}):nth-child(-n+${j})`;
  list
    .querySelectorAll(range)
    .forEach((elem) => (elem.style.display = "block"));

  if (listItems.length <= j) {
    this.remove();
  } else {
    k += 5;
    j += 5;
  }
});  


const list = document.querySelector(".col-6 col-md-6 col-lg-4");
const listItems = list.querySelectorAll(".display");
const ajaxLoadMoreBtn = document.querySelector(".ajax-load-more");

let k = 6;
let j = 10;

ajaxLoadMoreBtn.addEventListener("click", function () {
  let range = `li:nth-child(n+${k}):nth-child(-n+${j})`;
  list
    .querySelectorAll(range)
    .forEach((elem) => (elem.style.display = "block"));

  if (listItems.length <= j) {
    this.remove();
  } else {
    k += 5;
    j += 5;
  }
});    */