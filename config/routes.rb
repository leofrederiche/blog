Rails.application.routes.draw do

  root to: "welcome#index"

  controller :posts do
    get "/posts/new", action: :new, as: :new_post
    post "/posts/new", action: :create, as: false
    get "/post/:title", action: :show, as: :post

    get "/posts/:id/edit", action: :edit, as: :edit_post
    patch "/posts/:id/edit", action: :update, as: false

    delete "/posts/:id", action: :delete, as: :delete_post
  end
  
  controller :comments do
    post "/comments/new", action: :create, as: false #create comments
    delete "/comments/:id", action: :delete, as: :destroy_comment
  end
  

  devise_for :users

end
