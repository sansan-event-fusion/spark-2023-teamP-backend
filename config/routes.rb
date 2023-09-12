Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :recruitments, only: [:index, :show, :create]
  post 'recruitment/:id/apply' => 'recruitments#apply'
  resources :users, only: [:show]
end
