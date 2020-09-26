class Review < ApplicationRecord
  belongs_to :content
  belongs_to :reviewer, class_name: 'User'
  has_many :reviews_properties, class_name: 'ReviewsProperties'
  has_many :properties, through: :reviews_properties
  has_many :comments, as: :commentable
end
