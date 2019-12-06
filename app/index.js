'use strict';

import './tag/app.tag';
import QuizApp from './js/app';

async function main() {
  const res = await fetch("./pokedex.json");
  const QUIZ_DATA = await res.json();
  riot.mount('app', {
    'QuizApp': new QuizApp(QUIZ_DATA),
    'obs': riot.observable()
  });
}

main();