import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const { Route, inject } = Ember;
const { service } = inject;

export default Route.extend(AuthenticatedRouteMixin, {
  session: service('session'),

  actions: {
    logout() {
      this.get('session').invalidate();
    }
  }
});
