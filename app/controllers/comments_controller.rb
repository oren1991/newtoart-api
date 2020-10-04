class CommentsController < ApplicationController
  before_action :fetch_content_comments, only: :index, if: :content_id?

  def index
    render json: @comments, status: 200, serializer: CommentSerializer
  end

  def show

  end

  def update

  end

  def create
    result = CommentUpdateService.new(comment: Comment.new, params: params, current_user: @current_user).run
    render json: result, status: result.success ? 200 : 412, serializer: CommentServiceResultSerializer, include: "comment,comment.commenter"

  end

  private

  def fetch_content_comments
    @comments = Comment.where(commentable_id: params[:commentable_id], commentable_type: 'Content')
  end

  def content_id?
    params[:commentable_id] && params[:commentable_type] == 'content'
  end
end
