class User < ApplicationRecord
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts
  def recent_posts
    posts.last(3)
  end
end
