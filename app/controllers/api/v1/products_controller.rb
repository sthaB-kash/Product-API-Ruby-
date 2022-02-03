class Api::V1::ProductsController < ApplicationController
  before_action :find_product, except: %i[index create]

  def index
    @products = Product.all
    render json: @products
  end

  def show
    if @product
      render json: @product, status: 200
    else
      render json: { message: 'Not found!' }, status: 400
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { message: 'Product save successfully.' }, status: 200
    else
      render json: @product.errors, status: 400
    end
  end

  def update
    if @product
      @product.update(product_params)
      render json: @product, status: 200
    else
      render json: { message: 'Unable to update product record.' }, status: 400
    end
  end

  def destroy
    if @product
      @product.destroy
      render json: { message: 'Product Deleted.' }, status: 200
    else
      render json: { message: 'Record not found!' }, status: 400
    end
  end

  private

  def product_params
    params.require(:product).permit!
  end

  def find_product
    @product = Product.find_by_id(params[:id])
  end
end
