Rails.application.routes.draw do
  root to: 'welcome#home'

  get   'feed',                     to: 'posts#feed',       as: 'feed'
  get   '/login',                   to: 'sessions#bounce',  as: :login
  match '/auth/instagram/callback', to: 'sessions#create',  via: [:get]
  match '/auth/twitter/callback',   to: 'sessions#twitter', via: [:get]
  match '/auth/failure',            to: 'sessions#failure', via: [:get]

  resources :menu, only: [:index]
  resources :trips

  namespace :api do
    namespace :v1 do
      resources :trips, only: [:index, :show] do
        resources :posts, only: [:index, :show]
      end
    end
  end

end
