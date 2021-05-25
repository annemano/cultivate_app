const toggleQuestionsDisplay = () => {
  const next1 = document.getElementById("next-1");
  const next2 = document.getElementById("next-2");
  const firstQuestion = document.getElementById("first-question");
  const secondQuestion = document.getElementById("second-question");
  const thirdQuestion = document.getElementById("third-question");

  if (next1 || next2) {
    next1.addEventListener("click", (event) => {
      firstQuestion.classList.add("d-none");
      secondQuestion.classList.remove("d-none");
    });
    next2.addEventListener("click", (event) => {
      secondQuestion.classList.add("d-none");
      thirdQuestion.classList.remove("d-none");
    });
  }
};

export { toggleQuestionsDisplay }


