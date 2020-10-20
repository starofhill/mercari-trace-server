class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :payment_method, presence: true

  enum payment_method: {
    credit: 1,
    merpay: 2,
    convenience: 3,
    docomo: 4,
    au: 5,
    softbank: 6,
    familymart: 7
  }
end
