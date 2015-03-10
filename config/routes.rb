Rails.application.routes.draw do

  root to: "welcome#index"

  controller :posts do
    get "/posts/new", action: :new, as: :new_post
    post "/posts/new", action: :create, as: false
    get "/post/:id", action: :show, as: :post

    get "/posts/:id/edit", action: :edit, as: :edit_post
    patch "/posts/:id/edit", action: :update, as: false

    delete "/posts/:id/delete", action: :destroy, as: :destroy_post
  end
  
  controller :comments do
    post "/comments/new", action: :create, as: :new_comment
    delete "/comments/:id", action: :destroy, as: :destroy_comment
  end
  

  devise_for :users

end
