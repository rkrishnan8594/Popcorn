import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('signup');

  this.route('game', { path: '/game/:id' }, function() {
    this.route('edit');
    this.route('new-turn', { path: '/turn' });
  });

  this.route('games', { path: '/' });
  this.route('new', { path: '/games/new' });
  this.route('user', { path: '/user/:id' });
});

export default Router;
