class InstagramPostSerializer < ActiveModel::Serializer
  attributes :id, :link, :img_src, :caption, :instagram_username
  has_one :curator, serializer: UserSerializer
  has_one :reviewer, serializer: UserSerializer
end
