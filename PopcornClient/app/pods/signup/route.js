import Ember from 'ember';
import UnauthenticatedRouteMixin from 'ember-simple-auth/mixins/unauthenticated-route-mixin';

const { Route } = Ember;

export default Route.extend(UnauthenticatedRouteMixin, {
  model() {
    return this.store.createRecord('user');
  },

  actions: {
    save(user) {
      let newUser = user;
      newUser.save().catch((error) => {
        this.set('errorMessage', error);
      })
      .then((user) => {
        this.get('session')
        .authenticate('authenticator:devise',
          newUser.get('email'), newUser.get('password'))
        .catch((reason) => {
          this.set('errorMessage', reason.error ||reason);
        });
      });
    }
  }
});
