class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review_text, :properties, :src
  has_many :properties, serializer: ContentsPropertiesSerializer
  has_one :reviewer, serializer: UserSerializer

  def properties
    object.reviews_properties
  end

  def src
    SourcesService.new(id: object.id, source_type: "s3", media_hash: object.media_hash).run
  end
end
