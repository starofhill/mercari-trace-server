class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
    render json: @products, each_serializer: ProductSerializer
  end

  def show
    @product = Product.find_by(id: params[:id])

    render json: @product, serializer: ProductContentSerializer
  end

  def create
    @product = Product.new(product_params)

    if product_params[:image].present?
      @product.image.attach(Base64Parser.call(base64: product_params[:image]))
      # @product.image_url = rails_representation_url(@product.image.variant({}))
      @product.image_url = @product.image.service_url
    else
      render json: { message: "Image not found" }, status: :not_found and return
    end

    @product.user_id = current_user.id

    if @product.save
      render json: @product
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    render json: { message: "Product not found" }, status: :not_found and return if @product.blank?

    if @product.destroy
      render json: { message: "Success" }
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :status, :category, :image, :condition, :prefecture, :shipping_method, :shipping_fee, :shipping_day)
    end

end
