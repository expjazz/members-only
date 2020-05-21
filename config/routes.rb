Rails.application.routes.draw do
  get 'comments/create'
  root 'welcome#index'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
   resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
