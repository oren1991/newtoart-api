class UsersController < ApplicationController
  def index
    render json: User.all.as_json(include: [ :roles, likes: {include: :likable}]), status: 200
  end
end
