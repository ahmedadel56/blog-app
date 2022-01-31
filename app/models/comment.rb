class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  def update_comments_counter
    comments.increment!(:comments_counter)
  end
end
