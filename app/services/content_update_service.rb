class ContentUpdateService
  def initialize(content:, params:, current_user:)
    @content = content
    @params = params
    @current_user = current_user
  end

  def run
    result = nil
    success = false
    @content.transaction do
      update_content
      success = @content.save
      result = @content
    end
    ::OpenStruct.new(content: result, success: success, message: success ? "Success" : @content.errors.full_messages)
  end

  def update_content
    @content.update(
        artist: @current_user,
        title: @params[:title],
        description: @params[:description],
        source_type: @params[:source_type],
        media_hash: URI.decode(@params[:fileName])
    )
    @content.properties = Property.where(name: @params[:properties].map{|p| p[:name]})
  end

end
