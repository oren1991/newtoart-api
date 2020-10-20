class AddMediaHashToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :media_hash, :string
  end
end
