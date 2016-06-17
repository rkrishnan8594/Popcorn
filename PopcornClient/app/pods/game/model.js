import Ember from 'ember';
import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { hasMany } from 'ember-data/relationships';

export default Model.extend({
  name: attr('string'),
  current: attr('number'),
  players: hasMany('player', {async: true}),

  currentPlayer: Ember.computed('current', 'players', function() {
    return this.get('players').objectAt(this.get('current'));
  })
});
