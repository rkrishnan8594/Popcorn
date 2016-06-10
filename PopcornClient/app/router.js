import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('games', { path: '/' });
  this.route('signup');
  this.route('user', { path: '/user/:id' });
});

export default Router;
