class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def recent_comments
    comments.last(5)
  end

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
