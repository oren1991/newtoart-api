class S3sController < ApplicationController
  before_action :authorize, only: [:post_sign]

  def post_sign
    s3 = Aws::S3::Resource.new
    obj = s3.bucket('newtoart-development').presigned_post(key: "#{@current_user.id}/#{params[:content]}/#{random_string}", success_action_status: '201')
    render json: {signature: obj.fields, postEndpoint: obj.url}
  end

  def get_sign
    s3 = Aws::S3::Resource.new
    url = s3.bucket('newtoart-development').object(params[:object_key]).presigned_url(:get)
    render json: {url: url}
  end

  private

  def random_string
    (0...52).map { (65 + rand(26)).chr }.join + '.' + params[:file_name].split('.').last
  end
end
