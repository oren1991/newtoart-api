class Property < ApplicationRecord
  has_many :reviews_properties, class_name: 'ReviewsProperties'
  has_many :contents_properties, class_name: 'ContentsProperties'
  belongs_to :admin, class_name: 'User'
  has_many :likes, as: :likable
end
