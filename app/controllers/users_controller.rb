class UsersController < ApplicationController
  before_action :authorize, only: :auto_login
  def index
    render json: User.all.as_json(include: [ :roles, likes: {include: :likable}]), status: 200
  end

  def create
    @current_user = User.create(user_params)
    if @current_user.valid?
      @token = encode_token({user_id: @current_user.id})
      render json: login_success_result, serializer: LoginSuccessSerializer
    else
      render json: {error: "Signup invalid"}, status: 404
    end
  end

  def login
    @current_user = User.find_by(email: params[:email])

    if @current_user && @current_user.authenticate(params[:password])
      @token = encode_token({user_id: @current_user.id})
      render json: login_success_result, status: 200, serializer: LoginSuccessSerializer
    else
      render json: {error: "Invalid username or password"}, status: 404
    end
  end

  def auto_login
    render json: login_success_result, status: 200, serializer: LoginSuccessSerializer
  end

  private

  def user_params
    params.permit(:name, :password, :email)
  end

  def login_success_result
    OpenStruct.new(user: @current_user, token: @token)
  end
end
