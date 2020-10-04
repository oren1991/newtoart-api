class CommentSerializer < ActiveModel::Serializer
  has_one :commenter, serializer: UserSerializer
  attributes :id, :message, :created_at

end
