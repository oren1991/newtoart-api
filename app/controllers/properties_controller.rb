class PropertiesController < ApplicationController
  before_action :fetch_properties, only: [:index]
  def index
    render json: @properties, serializers: PropertyIndexSerializer
  end

  private

  def fetch_properties
    @properties = Property.all
  end
end
