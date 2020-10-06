class ContentsController < ApplicationController
  before_action :authorize, only: [:create]
  before_action :fetch_contents, only: :index
  before_action :fetch_content, only: :show

  def index
    render json: @contents, serializers: ContentIndexSerializer
  end

  def show
    render json: @content, serializer: ContentSerializer
  end

  def create
    result = ContentUpdateService.new(content: Content.new, params: params, current_user: @current_user).run
    render json: result, status: result.success ? 200 : 412, serializer: ContentServiceResultSerializer, include: "comment,comment.commenter"

  end

  private

  def fetch_contents
    @contents = Content.includes(:properties, :artist).all
  end

  def fetch_content
    @content = Content.find_by(id: params[:id])
  end
end
