class ContentServiceResultSerializer < ActiveModel::Serializer
  type ''

  has_one :content, serializer: ContentSerializer
  attributes :message, :success

  def read_attribute_for_serialization(attr)
    object[attr.to_s]
  end
end
