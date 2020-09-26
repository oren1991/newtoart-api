class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.belongs_to :artist
      t.string :title
      t.text :description
      t.string :source_type
      t.string :media_hash
      t.timestamps
    end
  end
end
