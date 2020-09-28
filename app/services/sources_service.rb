class SourcesService
  def initialize(source_type:, media_hash:)
    @source_type = source_type
    @media_hash = media_hash
  end

  def run
    "https://picsum.photos/200/300"
  end
end

