Rails.application.routes.draw do
  get 'hideposts/index'

  root to: 'welcome#home'

  get   'feed',                     to: 'posts#feed',       as: 'feed'
  get   '/login',                   to: 'sessions#bounce',  as: :login
  get   '/logout',                  to: 'sessions#destroy', as: :logout
  match '/auth/instagram/callback', to: 'sessions#create',  via: [:get]
  match '/auth/twitter/callback',   to: 'sessions#twitter', via: [:get]
  match '/auth/failure',            to: 'sessions#failure', via: [:get]

  resources :menu, only: [:index]
  resources :trips
  resources :travelings
  resources :hideposts
  resources :posts do
    resources :comments
  end
  get '/profile/:id', to: 'profiles#show'

  namespace :api do
    namespace :v1 do
      resources :trips, only: [:index, :show] do
        resources :posts, only: [:index, :show]
      end
    end
  end

end
