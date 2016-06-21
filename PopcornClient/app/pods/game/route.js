import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const {
  Route,
  computed
} = Ember;
const { service } = Ember.inject;

export default Route.extend(AuthenticatedRouteMixin, {
  sessionAccount: service('session-account'),

  model(params) {
    return this.store.findRecord('game', params.id);
  },

  setupController(controller, model) {
    this._super(controller, model);
    if(this.get('sessionAccount.user.id') == model.get('currentPlayer.user.id')) {
      controller.set('isMyTurn', true);
    } else {
      controller.set('isMyTurn', false);
    }
  }
});
