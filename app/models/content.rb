class Content < ApplicationRecord
  has_many :contents_properties, class_name: 'ContentsProperties'
  has_many :properties, through: :contents_properties
  has_many :comments, as: :commentable
  belongs_to :artist, class_name: 'User'
  has_many :likes, as: :likable
end
