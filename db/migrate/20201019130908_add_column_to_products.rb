class AddColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :condition, :string
    add_column :products, :prefecture, :integer
    add_column :products, :shipping_method, :integer
    add_column :products, :shipping_fee, :string
    add_column :products, :shipping_day, :integer
  end
end
