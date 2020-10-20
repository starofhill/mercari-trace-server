class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :product_id, :payment_method, :total_price, :created_at
end
