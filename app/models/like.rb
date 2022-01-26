class Likes < ApplicationRecord
  belongs_to :users, :posts
  def update_posts_counter
    likes.increment!(:likes_counter)
  end
end
