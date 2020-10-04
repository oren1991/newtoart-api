class CommentServiceResultSerializer < ActiveModel::Serializer
  type ''

  has_one :comment, serializer: CommentSerializer
  attributes :message, :success

  def read_attribute_for_serialization(attr)
    object[attr.to_s]
  end
end
