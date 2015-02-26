Rails.application.routes.draw do

  root to: "welcome#index"

  get "/new-post", to: "posts#new", as: :new_post
  post "/new-post", to: "posts#create"

  devise_for :users

end
