class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { onlyinteger: true }

  belongs_to :user
  has_many :comments
  has_many :purchases
end
