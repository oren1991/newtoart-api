class RenameTypeToReviewableType < ActiveRecord::Migration[5.2]
  def up
    rename_column :reviews, :type, :reviewable_type
  end

  def down
    rename_column :reviews, :reviewable_type, :type
  end
end
