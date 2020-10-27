class Review < ApplicationRecord
  validates :reviewer, uniqueness: { scope: :content, message: 'has already reviewed this content' }

  belongs_to :reviewable, polymorphic: true
  belongs_to :reviewer, class_name: 'User'
  has_many :reviews_properties, class_name: 'ReviewsProperties'
  has_many :properties, through: :reviews_properties
  has_many :comments, as: :commentable
  has_many :likes, as: :likable
end
