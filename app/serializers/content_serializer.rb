class ContentSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :properties, :loaded, :src
  has_many :properties, serializer: ContentsPropertiesSerializer
  has_one :artist, serializer: UserSerializer

  def properties
    object.contents_properties
  end

  def loaded
    false
  end

  def src
    SourcesService.new(id: object.id, source_type: object.source_type, media_hash: object.media_hash).run
  end
end
