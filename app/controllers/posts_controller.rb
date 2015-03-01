class PostsController < ApplicationController

  def new
    unless current_user
      redirect_to new_user_session_path
    end

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

  def show
    @post = Post.find_by_title(params[:title])
    @posts = Post.all.reverse
    @new_comment = Comment.new
    @comments = @post.comments.reverse
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    @post.update_attributes(params.require(:post).permit(:title, :text))
    @post.save

    redirect_to show_post_path(@post.title)
  end

  def delete
    @post = Post.find params[:id]

    @post.delete

    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end