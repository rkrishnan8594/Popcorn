import Ember from 'ember';

const {
  Component
} = Ember;

const {
  service
} = Ember.inject;

export default Component.extend({
  session: service('session'),
  sessionAccount: service('session-account'),

  actions: {
    logout() {
      this.get('session').invalidate();
    }
  }
});
