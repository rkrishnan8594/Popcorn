import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const {
  Route,
  set,
  computed
} = Ember;

export default Route.extend(AuthenticatedRouteMixin, {
  model(params) {
    return this.store.findRecord('game', params.id);
  },

  actions: {
    submit() {
      this.currentModel.incrementProperty('current');
    }
  }
});
