import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo } from 'ember-data/relationships';

export default Model.extend({
  answerType: attr('string'),
  isCorrect: attr('boolean'),
  answer: attr('string'),
  game: belongsTo('game', {async: true}),
  player: belongsTo('player', {async: true})
});
