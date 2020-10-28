class InstagramPostsController < ApplicationController
  before_action :fetch_instagram_posts, only: [:index]
  before_action :fetch_post, only: [:show]

  def index
    render json: @posts, serializers: InstagramPostSerializer
  end

  def show
    render json: @post, serializer: InstagramPostSerializer
  end

  def create
    result = InstagramUpdateService.new(instagram_post: InstagramPost.new, params: params, current_user: @current_user).run
    render json: result, status: result.success ? 200 : 412, serializer: InstagramServiceResultSerializer, include: "instagram_post,instagram_post.reviewer,instagram_post.curator"
  end

  private

  def fetch_instagram_posts
    @posts = InstagramPost.all
  end

  def fetch_post
    @post = InstagramPost.find_by(id: params[:id])
  end
end
