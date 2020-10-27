class ChangeReviewsToPolymorphic < ActiveRecord::Migration[5.2]
  def up
    add_column :reviews, :type, :string
    rename_column :reviews, :content_id, :reviewable_id
  end

  def down
    remove_column :reviews, :type
    rename_column :reviews, :reviewable_id, :content_id
  end
end
