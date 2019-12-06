import Questioner from './questioner'

class Player {
  constructor() {
    this.correct_answer_count = 0;
  }
  answer(questioner = Questioner, answer = -1) {
    const judge = questioner.judgeQuiz(answer);
    this.correct_answer_count += (judge.result) ? 1 : 0;
    return judge;
  }
  getCorrectAnswerCount() {
    return this.correct_answer_count;
  }
}

export default Player;