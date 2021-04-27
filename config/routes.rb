Rails.application.routes.draw do
    
  get 'relationships/create'
  get 'relationships/destroy'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  root 'movies#index'
  resources :movies
  resources :reviews
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member 
    get :followers, on: :member 
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  post 'movies/:id' => "movies#show",as: "detail"
  get 'movies/:id' => "movies#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
