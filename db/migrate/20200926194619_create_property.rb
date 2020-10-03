class CreateProperty < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :description
      t.string :icon
      t.belongs_to :admin
      t.timestamps
    end
  end
end
