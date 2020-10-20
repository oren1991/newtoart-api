class ReviewUpdateService
  def initialize(review:, params:, current_user:)
    @review = review
    @params = params
    @current_user = current_user
  end

  def run
    result = nil
    success = false
    @review.transaction do
      update_review
      success = @review.save
      result = @review
    end
    ::OpenStruct.new(review: result, success: success, message: success ? "Success" : @review.errors.full_messages)
  end

  def update_review
    @review.update(
        reviewer: @current_user,
        content: Content.find(@params[:content_id]),
        review_text: @params[:review_text],
        media_hash: URI.decode(@params[:image_name])
    )
    create_property_values
  end

  def create_property_values
    @params[:review_properties].map do |rp|
      ReviewsProperties.create(
          property: Property.find_by_name(rp[:name]),
          review: @review,
          value: rp[:value]
      )
    end
  end
end
