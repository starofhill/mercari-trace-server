class ProductContentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :status, :category, :user_id, :image_url, :created_at

  belongs_to :user
  has_many :comments
end
