class LoginSuccessSerializer < ActiveModel::Serializer
  type ''

  has_one :user, serializer: UserSerializer
  attributes :token

  def read_attribute_for_serialization(attr)
    object[attr.to_s]
  end
end
