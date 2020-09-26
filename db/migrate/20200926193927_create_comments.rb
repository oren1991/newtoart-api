class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.bigint :commentable_id
      t.string :commentable_type
      t.string :message
      t.belongs_to :commenter
      t.timestamps
    end
  end
end
