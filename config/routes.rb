Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/cards", to: "cards#index"
  # get "/new", to: "cards#new"
  # get "/cards/new", to: "cards#new"
  resources :cards

  get "/", to: "cards#index"
  # root "cards#index"
end
