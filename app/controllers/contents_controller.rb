class ContentsController < ApplicationController
  before_action :fetch_contents, only: :index
  before_action :fetch_content, only: :show

  def index
    render json: { media: @contents }, status: 200
  end

  def show
    render json: { media: @content }, status: 200
  end

  private

  def fetch_contents
    @contents = Content.all.as_json(include:  [:artist, contents_properties: {include: :property}] )
  end

  def fetch_content
    @content = Content.find_by(id: params[:id]).as_json(include:  [:artist, contents_properties: {include: :property}] )
  end
end
