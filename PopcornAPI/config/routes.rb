Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'api/v1/sessions' }
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources 'games'

      get 'actors'        => 'actors#index'
      get 'actors/:name'  => 'actors#find'
      get 'movies'        => 'movies#index'
      get 'movies/:title' => 'movies#find'

      get 'users/me'  => 'users#me'
      get 'users/:id' => 'users#find'
      post 'users'    => 'users#create'

      get 'players/:id' => 'players#find'
    end
  end
end
