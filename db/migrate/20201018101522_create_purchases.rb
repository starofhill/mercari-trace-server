class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :payment_method
      t.integer :total_price

      t.timestamps
    end
  end
end
