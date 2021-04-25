Rails.application.routes.draw do
  get 'movies/search'
  get 'movies/show'
  resources :reviews
   post "movies/:id" => "movies#testt"
  root 'movies#search'
  post "movies/:id" => "movies#testt"
  get 'movies/:id' => "movies#show",as: 'detail'
  post 'movies/:id/show' => "movies#showing",as: "showing"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
