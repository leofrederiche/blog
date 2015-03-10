class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)

    if comment.save
      redirect_to post_path(comment.post)
    else
      flash[:notice] = "Ops, algo deu errado"
      redirect_to post_path(comment.post)
    end
  end

  def destroy
    comment = Comment.find params[:id]
    post = comment.post_id
    comment.destroy

    redirect_to post_path(post)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :comment, :post_id)
  end

end