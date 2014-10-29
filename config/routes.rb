Rails.application.routes.draw do
  root to: 'welcome#home'

  get '/login', to: 'sessions#new', as: :login
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: [:get, :post]
end
