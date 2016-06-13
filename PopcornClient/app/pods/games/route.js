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

  model() {
    return this.store.findAll('game');
  }
});
