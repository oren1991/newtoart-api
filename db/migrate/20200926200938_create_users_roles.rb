class CreateUsersRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :users_roles do |t|
      t.belongs_to :user
      t.belongs_to :role
    end
  end
end
