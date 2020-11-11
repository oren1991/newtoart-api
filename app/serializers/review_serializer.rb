class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review_text, :properties, :src, :generated_review
  has_many :properties, serializer: ContentsPropertiesSerializer
  has_one :reviewer, serializer: UserSerializer

  def properties
    object.reviews_properties.sort_by{|rp| rp.property.id}
  end

  def generated_review
    Services::GenerateInstagramPost.new(object).run
  end

  def src
    SourcesService.new(id: object.id, source_type: "s3", media_hash: object.media_hash).run
  end
end
