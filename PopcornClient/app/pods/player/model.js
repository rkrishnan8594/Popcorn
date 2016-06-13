import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo } from 'ember-data/relationships';

export default Model.extend({
  game: belongsTo('game', { async: true }),
  user: belongsTo('user', { async: true })
});
