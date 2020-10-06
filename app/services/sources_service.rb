class SourcesService
  def initialize(id:, source_type:, media_hash:)
    @id = id
    @source_type = source_type
    @media_hash = media_hash
  end

  def run
    if @source_type == 's3'
      s3 = Aws::S3::Resource.new
      return s3.bucket('newtoart-development').object(@media_hash).presigned_url(:get)
    end
    "https://picsum.photos/id/#{@id}/1000/#{rand(600...1200)}?ts=#{rand(30000)}"
  end
end

