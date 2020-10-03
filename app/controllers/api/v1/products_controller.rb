class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find_by(id: params[:id])
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if product_params[:image].present?
      @product.image.attach(Base64Parser.call(base64: product_params[:image]))
      # @product.image_url = rails_representation_url(@product.image.variant({}))
      @product.image_url = @product.image.service_url
    end

    if @product.save
      render json: @product
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :image, :price, :status, :category)
    end

end
