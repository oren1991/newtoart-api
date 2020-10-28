class InstagramUpdateService
  def initialize(instagram_post:, params:, current_user:)
    @post = instagram_post
    @params = params
    @current_user = current_user
  end

  def run
    result = nil
    success = false
    @post.transaction do
      update_instagram_post
      success = @post.save
      result = @post
    end
    ::OpenStruct.new(instagram_post: result, success: success, message: success ? "Success" : @post.errors.full_messages)
  end

  def update_instagram_post
    @post.update(
        curator: @current_user,
        link: @params[:link],
        media_hash: URI.decode(@params[:media_hash]),
        source_type: 's3',
        caption: @params[:caption],
        instagram_username: @params[:instagram_username],
    )
  end
end
