class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts
  ROLES = %i[admin default].freeze

  def recent_posts
    posts.includes(:comments).last(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
