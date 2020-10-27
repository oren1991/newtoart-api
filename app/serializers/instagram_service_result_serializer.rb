class InstagramServiceResultSerializer < ActiveModel::Serializer
  type ''
  attributes :message, :success, :instagram_post
  has_one :instagram_post, serializer: InstagramPostSerializer

  def read_attribute_for_serialization(attr)
    object[attr.to_s]
  end
end
