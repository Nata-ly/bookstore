Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  get '/help' => 'help#index'
  resources :books, only: [:index, :show] do
    resources :comments
  end
  get 'manager' => 'manager/index#index'
  namespace :manager do
    resources :categories, expect: [:show]
    resources :authors, expect: [:show]
    resources :books
    resources :feed_jobs
  end
end
