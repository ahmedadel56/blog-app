class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  after_create :update_post_counter

  def update_post_counter
    user = User.find(user_id)
    user.increment!(:posts_counter)
    user.save
  end

  def most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end
end
