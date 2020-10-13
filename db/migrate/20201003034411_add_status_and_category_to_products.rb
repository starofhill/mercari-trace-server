class AddStatusAndCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :status, :string
    add_column :products, :category, :string
  end
end
