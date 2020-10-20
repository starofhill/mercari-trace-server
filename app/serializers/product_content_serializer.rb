class ProductContentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :status, :category, :condition, :prefecture, :shipping_method, :shipping_fee, :shipping_day, :user_id, :image_url, :created_at

  belongs_to :user
  has_many :comments
end
