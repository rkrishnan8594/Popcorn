import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const {
  Route
} = Ember;

const {
  service
} = Ember.inject;

export default Route.extend(AuthenticatedRouteMixin, {
  session: service('session'),

  model(params) {
    return this.store.findRecord('game', params.id);
  }
});
