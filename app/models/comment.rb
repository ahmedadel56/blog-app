class Comments < ApplicationRecord
  belongs_to :user, :post
  def update_comments_counter
    comments.increment!(:comments_counter)
  end
end
