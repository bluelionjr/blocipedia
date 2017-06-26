Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :user_upgrades, only: [:edit]
  resources :user_downgrades, only: [:edit]

  devise_for :users, controllers: { sessions: 'users/sessions' }

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
