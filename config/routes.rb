Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users
  get 'recruitments/search' => 'recruitments#search'
  resources :recruitments, only: [:index, :show, :create]
  post 'recruitments/:id/apply' => 'recruitments#apply'
  resources :users, only: [:show]
end
