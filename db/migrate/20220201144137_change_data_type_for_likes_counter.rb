class ChangeDataTypeForLikesCounter < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :likes_counter, :integer , using: 'likes_counter::integer'
  end
end
