import Quiz from './quiz'

class QuizCollection {
  constructor(quiz_collection = {}) {
    this.collection = quiz_collection;
  }
  getCollection(genre) {
    if (!this.collection[genre]) throw Error("そのジャンルの問題はありません");
    return this.collection[genre];
  }
  getGenre() {
    return Object.keys(this.collection).map(genre => { return { "id": genre, "name": this.collection[genre].name } });
  }
}

export default QuizCollection;