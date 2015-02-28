Rails.application.routes.draw do

  root to: "welcome#index"

  get "/new-post", to: "posts#new", as: :new_post
  post "/new-post", to: "posts#create"
  get "/post/:title", to: "posts#show", as: :show_post
  post "/post/:title", to: "comments#create" #create comments

  devise_for :users

end
