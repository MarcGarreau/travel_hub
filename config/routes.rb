Rails.application.routes.draw do
  root to: 'welcome#home'

  resources :menu, only: [:index]

  resources :trips
end
