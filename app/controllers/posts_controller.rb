class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Postagen postada"
      redirect_to root_path
    else
      flash[:notice] = "Ops, algo deu errado"
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
    @posts = Post.all.reverse
    @comment = Comment.new(post_id: @post.id)
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    @post.update_attributes(post_params)

    if @post.save
      redirect_to post_path(@post)      
    else
      render :edit
    end
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end