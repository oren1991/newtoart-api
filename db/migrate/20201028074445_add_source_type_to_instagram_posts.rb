class AddSourceTypeToInstagramPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :instagram_posts, :source_type, :string
  end
end
