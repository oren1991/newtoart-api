class Property < ApplicationRecord
  has_many :reviews_properties, class_name: 'ReviewsProperties'
  belongs_to :admin, class_name: 'User'
  has_many :likes, as: :likable
end
