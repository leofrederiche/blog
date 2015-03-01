Rails.application.routes.draw do

  root to: "welcome#index"

  get "/new-post", to: "posts#new", as: :new_post
  post "/new-post", to: "posts#create"
  get "/post/:title", to: "posts#show", as: :show_post

  post "/post/:title", to: "comments#create" #create comments
  get "/delete-comment/:id", to: "comments#delete", as: :delete_comment

  get "/edit/post/:id", to: "posts#edit", as: :edit_post
  patch "/edit/post/:id", to: "posts#update"

  get "/delete-post/:id", to: "posts#delete", as: :delete_post

  devise_for :users

end
