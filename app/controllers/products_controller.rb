class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]


  # GET /products
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products
  def show
    render json: @product
  end

  # GET / products
  def create
    @product = Product.new(product_params)
    
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: unprocessable_entity
    end
  end

  # PATCH /product/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: unprocessable_entity
    end
  end

  # DELETE /product/1
  def destroy
    @product.destroy
  end

  private
    # Use calbacks to share common setup or constraints betwenn actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # only allow a trusted parameter "white list" through.

    def product_params
      params.require(:product).permit(:name, :price)
    end

end
