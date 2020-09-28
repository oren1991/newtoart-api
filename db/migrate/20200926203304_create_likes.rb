class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.bigint :likable_id
      t.string :likable_type
    end
  end
end
