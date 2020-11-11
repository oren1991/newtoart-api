class ReviewsController < ApplicationController
  before_action :fetch_reviews, only: :index
  before_action :fetch_review, only: [:update]

  def index
    render json: @reviews, serializers: ReviewSerializer
  end

  def create
    result = ReviewUpdateService.new(review: Review.new, reviewable: reviewable, params: params, current_user: @current_user).run
    render json: result, status: result.success ? 200 : 412, serializer: ReviewServiceResultSerializer, include: 'review,review.reviewer'
  end

  def update
    result = ReviewUpdateService.new(review: @review, reviewable: reviewable, params: params, current_user: @current_user).run
    render json: result, status: result.success ? 200 : 412, serializer: ReviewServiceResultSerializer, include: 'review,review.reviewer'
  end

  private

  def fetch_reviews
    if params[:all]
      @reviews = Review.where(reviewable_type: params[:reviewable_type].camelize)
    else
      @reviews = Review.where(reviewable: reviewable)
      @reviews.where(reviewer: @current_user) if params[:current_user] == 'true'
    end
  end

  def fetch_review
    @review = Review.find_by(id: params[:id])
  end

  def reviewable
    @reviewable || Review.reviewable_classes[params[:reviewable_type]].find_by(id: params[:reviewable_id]) unless params[:all]
  end
end
