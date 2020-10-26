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
    ::OpenStruct.new(comment: result, success: success, message: success ? "Success" : @post.errors.full_messages)
  end

  def update_instagram_post
    @post.update(
        curator: @current_user,
        link: @params[:link],
        img_src: @params[:img_src],
        caption: @params[:caption],
        instagram_username: @params[:instagram_username],
    )
  end
end
