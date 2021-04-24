Rails.application.routes.draw do
  get 'movies/search'
  get 'movies/show'

  resources :reviews
  root 'movies#search'
  get 'movies/:id' => "movies#show",as: 'detail'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
