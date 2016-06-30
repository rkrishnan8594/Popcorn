import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const { Route } = Ember;

export default Route.extend(AuthenticatedRouteMixin, {
  model() {
    return this.store.createRecord('turn', {
      game: this.modelFor('game'),
      player: this.modelFor('game').get('currentPlayer')
    });
  }
});
