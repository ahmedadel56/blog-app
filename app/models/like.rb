class Like < ApplicationRecord
  belongs_to :user, :post
  def update_posts_counter
    likes.increment!(:likes_counter)
  end
end
