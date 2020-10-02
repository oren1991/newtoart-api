class Content < ApplicationRecord
  has_many :contents_properties, class_name: 'ContentsProperties'
  has_many :properties, through: :contents_properties
  has_many :comments, as: :commentable
  belongs_to :artist, class_name: 'User'
  has_many :likes, as: :likable

  private

  def serializable_hash(options = nil)
    super.merge({'loaded' => false, 'src' => generate_src })
  end

  def generate_src
    SourcesService.new(id: id, source_type: source_type, media_hash: media_hash).run
  end

end
