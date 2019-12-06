class Quiz {
  constructor(quiz = {}) {
    this.getQuestionStatement = () => quiz.question_statement;
    this.getChoices = () => quiz.choices;
    this.getAnswer = () => quiz.answer;
  }
  propose() {
    return {
      "statement": this.getQuestionStatement(),
      "choices": this.getChoices()
    };
  }
}

export default Quiz;