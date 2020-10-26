class InstagramServiceResultSerializer < ActiveModel::Serializer
  type ''

  has_one :instagram_post, serializer: InstagramPostSerializer
  attributes :message, :success

  def read_attribute_for_serialization(attr)
    object[attr.to_s]
  end
end
