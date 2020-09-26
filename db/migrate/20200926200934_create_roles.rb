class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :admin
      t.boolean :viewer
      t.boolean :artist
      t.boolean :reviewer
      t.timestamps
    end
  end
end
