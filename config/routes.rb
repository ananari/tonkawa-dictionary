Rails.application.routes.draw do
  resources :wordlinks
  resources :words
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/search', to: "words#search"
  root to: "words#home"
end
