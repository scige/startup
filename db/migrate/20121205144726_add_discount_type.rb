class AddDiscountType < ActiveRecord::Migration
  def change
    add_column :products, :discount_type, :integer, :default => DISCOUNT_TYPE_DISCOUNT
    add_column :products, :price, :float
    add_column :products, :specific, :string
  end
end
