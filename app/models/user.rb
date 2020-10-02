class User < ApplicationRecord
  include BCrypt

  has_many :contents
  has_many :reviews
  has_many :users_roles, class_name: 'UsersRoles'
  has_many :roles, through: :users_roles
  has_many :likes, as: :likable
  has_many :liked, class_name: 'Like'

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def authenticate(given_password)
    password == given_password
  end
end
