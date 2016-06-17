import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const { Route } = Ember;

export default Route.extend(AuthenticatedRouteMixin, {
  model() {
    return this.store.createRecord('game');
  },

  deactivate() {
    this.currentModel.deleteRecord();
  },

  actions: {
    save(model) {
      let self = this;
      model.save().then(function() {
        self.transitionTo('games');
      });
    }
  }
});
