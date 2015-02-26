class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @new = Post.new
  end

  def create
    @new = Post.create(post_params)

    if @new.save
      flash[:notice] = "Postagen postada"
      redirect_to root_path
    else
      flash[:notice] = "Ops, algo deu errado"
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end