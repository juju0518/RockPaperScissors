Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [ :new, :create, :index, :show ] do
    get "play", to: "games#new"
    post "play", to: "games#create"
  end
  resources :games, only: [ :show ]
end
