class Api::V1::PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase = Purchase.all
    render json: @purchase
  end

  def create
    product = Product.find_by(id: purchase_params[:product_id])

    if product.present? && product.status === "sale"
      @purchase = product.purchases.build(purchase_params)
      @purchase.user_id = current_user.id

      if ["convenience", "docomo", "au", "softbank"].include?((purchase_params[:payment_method]))
        @purchase.total_price = product.price + 100
      else
        @purchase.total_price = product.price
      end
    else
      render json: { message: "Product not found" }, status: :not_found and return
    end

    if @purchase.save
      product.update(status: "sold")
      render json: @purchase
    else
      render json: { message: "処理が完了しませんでした"}, status: :internal_server_error
    end
  end

  private
    def purchase_params
      params.require(:purchase).permit(:product_id, :payment_method)
    end

end
