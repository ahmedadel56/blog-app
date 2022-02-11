class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :update_comment_counter

  def update_comment_counter(current_post_id = post_id)
    post = Post.find(current_post_id)
    post.increment!(:comments_counter)
    post.save
  end

  def user_name(user_id)
    user = User.find(user_id)
    user.name
  end
end
