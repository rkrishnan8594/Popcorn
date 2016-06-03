Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      get 'actors' => 'actors#index'
      get 'actors/:name' => 'actors#find'
      get 'movies' => 'movies#index'
      get 'movies/:title' => 'movies#find'
    end
  end
end
