class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(
      text: comment_params,
      user_id: current_user.id,
      post_id: @post.id
    )
    new_comment.update_comments_counter
    if new_comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}"
    else
      flash[:error] = "Couldn\'t create the comment"
    end
  end
  def destroy
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @post.comments_counter -= 1
    @post.save
    redirect_to("/users/#{current_user.id}/posts/#{@post.id}")
    flash[:success] = 'Comment was deleted!'
  end
  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
