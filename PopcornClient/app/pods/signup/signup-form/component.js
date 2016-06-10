import Ember from 'ember';

const { Component } = Ember;
const { service } = Ember.inject;

export default Component.extend({
  session: service('session'),

  actions: {
    submit() {
      let user = this.get('user');
      this.attrs.triggerSave(user);
    }
  }
});
