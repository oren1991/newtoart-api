class ReviewServiceResultSerializer < ActiveModel::Serializer
  type ''

  has_one :review, serializer: ReviewSerializer
  attributes :message, :success

  def read_attribute_for_serialization(attr)
    object[attr.to_s]
  end
end
