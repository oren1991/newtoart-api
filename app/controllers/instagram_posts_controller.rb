class InstagramPostsController < ApplicationController
  before_action :fetch_properties, only: [:index]

  def index
    render json: @properties, serializers: InstagramPostSerializer
  end

  def create
    result = InstagramUpdateService.new(instagram_post: InstagramPost.new, params: params, current_user: @current_user).run
    render json: result, status: result.success ? 200 : 412, serializer: ContentServiceResultSerializer, include: "reviewer, curator"
  end

  private

  def fetch_properties
    @posts = InstagramPost.all
  end
end
