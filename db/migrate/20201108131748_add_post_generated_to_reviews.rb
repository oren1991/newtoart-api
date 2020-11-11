class AddPostGeneratedToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :generated_post, :boolean, default: false
  end
end
