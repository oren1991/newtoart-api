class CreateContentsProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :contents_properties do |t|
      t.belongs_to :property
      t.belongs_to :content
      t.integer :value
    end
  end
end
