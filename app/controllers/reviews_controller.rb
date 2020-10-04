class ReviewsController < ApplicationController
  before_action :fetch_content_reviews, only: :index, if: :content_id?

  def index
    render json: @reviews, serializers: ReviewSerializer
  end

  def create
    result = ReviewUpdateService.new(review: Review.new, params: params, current_user: @current_user).run
    render json: result, status: result.success ? 200 : 412, serializer: ReviewServiceResultSerializer, include: 'review,review.reviewer'
  end

  def update

  end

  private

  def fetch_content_reviews
    @reviews = Review.where(content_id: params[:content_id])
  end

  def content_id?
    !!params[:content_id]
  end
end
