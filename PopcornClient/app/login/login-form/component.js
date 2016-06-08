import Ember from 'ember';

const { Component, inject } = Ember;
const { service } = inject;

export default Component.extend({
  session: service('session'),

  actions: {
    authenticate: function() {
      let { identification, password } = this.getProperties('identification', 'password');
      return this.get('session').authenticate('authenticator:devise', identification, password).catch((reason) => {
        this.set('errorMessage', reason.error);
      });
    }
  }
});
