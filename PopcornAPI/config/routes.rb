Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'api/v1/users/sessions' }
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      get 'actors' => 'actors#index'
      get 'actors/:name' => 'actors#find'
      get 'movies' => 'movies#index'
      get 'movies/:title' => 'movies#find'
      get 'users/me', to: 'users#me'
      post 'users', to: 'users#create'
    end
  end
end
