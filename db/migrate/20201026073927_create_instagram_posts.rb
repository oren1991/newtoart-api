class CreateInstagramPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_posts do |t|
      t.string :link
      t.string :media_hash
      t.text :caption
      t.string :instagram_username
      t.belongs_to :curator
      t.belongs_to :reviewer
    end
  end
end
