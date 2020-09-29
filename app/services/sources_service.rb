class SourcesService
  def initialize(source_type:, media_hash:)
    @source_type = source_type
    @media_hash = media_hash
  end

  def run
    "https://picsum.photos/1000/#{rand(600...1200)}?ts=#{rand(30000)}"
  end
end

