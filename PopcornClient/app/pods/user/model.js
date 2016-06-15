import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { hasMany } from 'ember-data/relationships';

export default Model.extend({
  email: attr('string'),
  username: attr('string'),
  password: attr('string'),
  passwordConfirmation: attr('string'),
  players: hasMany('player', {async: true})
});
