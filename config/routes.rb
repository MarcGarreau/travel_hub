Rails.application.routes.draw do
  root to: 'welcome#home'

  get   'feed',                     to: 'posts#feed',       as: 'feed'
  get   '/login',                   to: 'sessions#bounce',  as: :login
  match '/auth/:provider/callback', to: 'sessions#create',  via: [:get, :post]
  match '/auth/failure',            to: 'sessions#failure', via: [:get, :post]

  resources :menu, only: [:index]
  resources :trips

end
