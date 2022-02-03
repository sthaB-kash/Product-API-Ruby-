class Api::V1::SuppliersController < ApplicationController
  before_action :find_supplier, except: %i[index create]

  def index
    @suppliers = Supplier.all
    render json: @suppliers
  end

  def show
    if @supplier.present?
      render json: @supplier, status: 200
    else
      render json: { message: 'not found' }, status: 400
    end
  end

  def create
    @supplier = Supplier.new(supplier_params)
    return render json: @supplier, status: 200 if @supplier.save

    render json: @supplier.errors
  end

  def update

  end

  def destroy

  end

  private

  def supplier_params
    params.require(:supplier).permit(:name, :address, :contact)
  end

  def find_supplier
    @supplier = Supplier.find_by_id(params[:id])
  end
end