class ContentsController < ApplicationController
  def index
    render json: {hello: "world"}, status: 200
  end
end
