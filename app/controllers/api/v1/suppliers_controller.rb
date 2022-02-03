class Api::V1::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render json: @suppliers
  end

  def show
    begin
      @supplier = Supplier.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      puts e, e.inspect
      @supplier = { message: 'not found' }
    end
    render json: @supplier
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
end