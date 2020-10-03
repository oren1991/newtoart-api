class ReviewsController < ApplicationController
  before_action :fetch_media_reviews, only: :index, if: :content_id?
  before_action :authorize, only: :create

  def index
    render json: @reviews, serializers: ReviewSerializer
  end

  def create

  end

  def update

  end

  private

  def fetch_media_reviews
    @reviews = Review.where(content_id: params[:content_id])
  end

  def content_id?
    !!params[:content_id]
  end
end
