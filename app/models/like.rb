class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  def update_posts_counter
    likes.increment!(:likes_counter)
  end
end
