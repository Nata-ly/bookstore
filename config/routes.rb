Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  get '/help' => 'help#index'
  resources :books, only: [:index, :show] do
    resources :comments
  end
end
