import Quiz from "./quiz"
import QuizCollection from "./quiz_collection"

class Questioner {
  constructor(quiz_collection = QuizCollection, genre = "") {
    const QUIZ_DATA = quiz_collection.getCollection(genre);
    this.questions = JSON.parse(JSON.stringify(QUIZ_DATA));
    this.current_quiz = null;
    this.isAnswered = true;
  }
  giveQuiz() {
    if (!this.isAnswered) throw Error("前回の問題が未回答です");
    if (this.questions.quiz.length === 0) throw Error("クイズが空です");
    const quiz = this.questions.quiz.splice(Math.floor(Math.random() * this.questions.quiz.length), 1)[0];
    this.current_quiz = new Quiz(quiz);
    this.isAnswered = false;
    return this.current_quiz.propose();
  }
  judgeQuiz(answer = -1) {
    const result = this.current_quiz.getAnswer() === answer;
    const correct_answer = this.current_quiz.getChoices()[this.current_quiz.getAnswer()];
    this.isAnswered = true;
    return {
      "result": result,
      "correct_answer": correct_answer
    };
  }
}
export default Questioner;