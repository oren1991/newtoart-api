class ContentsController < ApplicationController
  before_action :fetch_contents, only: :index
  before_action :fetch_content, only: :show

  def index
    render json: @contents, serializers: ContentIndexSerializer
  end

  def show
    render json: @content, serializer: ContentSerializer
  end

  private

  def fetch_contents
    @contents = Content.includes(:properties, :artist).all
  end

  def fetch_content
    @content = Content.find_by(id: params[:id])
  end
end
