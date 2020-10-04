class CommentUpdateService
  def initialize(comment:, params:, current_user:)
    @comment = comment
    @params = params
    @current_user = current_user
  end

  def run
    result = nil
    success = false
    @comment.transaction do
      update_comment
      success = @comment.save
      result = @comment
    end
    ::OpenStruct.new(comment: result, success: success, message: success ? "Success" : @comment.errors.full_messages)
  end

  def update_comment
    @comment.update(
        commenter: @current_user,
        commentable: @params[:commentable_type].capitalize.constantize.find(@params[:commentable_id]),
        message: @params[:message]
    )
  end
end
