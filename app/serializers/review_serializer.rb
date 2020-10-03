class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review_text, :properties
  has_many :properties, serializer: ContentsPropertiesSerializer
  has_one :reviewer, serializer: UserSerializer

  def properties
    object.reviews_properties
  end
end
