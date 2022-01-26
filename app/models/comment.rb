class Comments < ApplicationRecord
  belongs_to :users, :posts
  def update_comments_counter
    comments.increment!(:comments_counter)
  end
end
