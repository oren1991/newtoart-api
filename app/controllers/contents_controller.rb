class ContentsController < ApplicationController
  before_action :fetch_contents, only: :index
  def index
    render json: {media: @contents}, status: 200
  end

  private

  def fetch_contents
    @contents = Content.all.as_json(include:  [:artist, contents_properties: {include: :property}] )
  end
end
