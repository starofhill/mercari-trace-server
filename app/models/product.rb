class Product < ApplicationRecord
  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { onlyinteger: true }
end
