class Api::V1::ProductsController < ApplicationController
  def index
    render json: { greeting: 'hello world' }, status: 200
  end
end
