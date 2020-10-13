class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :status, :category, :user_id, :image_url, :created_at
end
