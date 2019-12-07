import QuizCollection from './quiz_collection';

const GENERATION = [151, 251, 386, 493, 649, 720, 809];
const GENERATION_NAME = ["赤/緑", "ゴールド/シルバー", "ルビー/サファイア", "ダイヤモンド/パール", "ブラック/ホワイト", "X/Y", "サン/ムーン/ピカブイ"];
const CHOICES = 5;

class PokeQuizCollection extends QuizCollection {
  constructor() {
    super(...arguments);
    this.pokedex = JSON.parse(JSON.stringify(this.collection));
    this.collection = this.makeCollection();
  }
  makeCollection() {
    const collection = { "all": { "name": "全国版", "quiz": [] } };
    GENERATION_NAME.forEach((name, i) => {
      const tmp_object = {
        "name": name,
        "quiz": []
      };
      collection[i] = tmp_object;
    });
    this.pokedex.forEach(pokemon => {
      const generation = GENERATION.findIndex(id => pokemon.id <= id);
      if (generation === -1) return;
      const choices = this.pickRandomPokemon(pokemon.id);
      const correct_index = Math.floor(Math.random() * choices.length);
      choices.splice(correct_index, 0, pokemon.name.japanese);
      const quiz_obj = {
        "question_statement": ("00" + pokemon.id).slice(-3),
        "choices": choices,
        "answer": correct_index
      };
      collection[generation].quiz.push(quiz_obj);
      collection.all.quiz.push(quiz_obj);
    })
    return collection;
  }
  pickRandomPokemon(ignore_id) {
    let tmp_array = [];
    while (tmp_array.length < (CHOICES - 1)) {
      const pokemon = this.pokedex[Math.floor(Math.random() * this.pokedex.length)];
      if (pokemon.id === ignore_id) continue;
      tmp_array.push(pokemon.name.japanese);
      tmp_array = Array.from(new Set(tmp_array));
    }
    return tmp_array;
  }
  getCollection() {
    this.collection = this.makeCollection();
    return super.getCollection(...arguments);
  }
}

export default PokeQuizCollection;