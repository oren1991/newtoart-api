class InstagramPostSerializer < ActiveModel::Serializer
  attributes :id, :link, :media_hash, :caption, :instagram_username, :src, :loaded
  has_one :curator, serializer: UserSerializer
  has_one :reviewer, serializer: UserSerializer

  def loaded
    false
  end

  def src
    SourcesService.new(id: object.id, source_type: object.source_type, media_hash: object.media_hash).run
  end
end
