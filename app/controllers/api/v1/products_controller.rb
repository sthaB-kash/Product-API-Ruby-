class Api::V1::ProductsController < ApplicationController
  def index
    render json: { greeting: 'hello world' }, stauts: 200
  end
end
