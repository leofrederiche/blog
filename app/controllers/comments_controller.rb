class CommentsController < ApplicationController

  def create
    @post = Post.find_by_title(params[:title])
    @new = Comment.create(comment_params)
    @new.id_post = @post.id

    if @new.save
      redirect_to show_post_path(@post.title)
    else
      flash[:notice] = "Ops, algo deu errado"
      redirect_to show_post_path(@post.title)
    end
  end

  def delete
    @comment = Comment.find params[:id]
    @comment.delete

    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :comment, :id_post)
  end

end