class User < ApplicationRecord
  has_many :contents
  has_many :reviews
  has_many :users_roles, class_name: 'UsersRoles'
  has_many :roles, through: :users_roles
end
