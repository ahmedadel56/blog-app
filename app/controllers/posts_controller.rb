class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @like = current_user.likes.where(post_id: params[:id]).exists?
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(post_params)
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    new_post.update_posts_counter
    respond_to do |format|
      format.html do
        if new_post.save
          flash[:notice] = 'Post created successfully'
          redirect_to "/users/#{new_post.user.id}/posts/"
        else
          flash[:error] = "Couldn't create post"
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = User.find(@post.user_id)
    @user.posts_counter -= 1
    @user.save
    redirect_to("/users/#{current_user.id}")
    flash[:success] = 'Post was destroyed!'
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
