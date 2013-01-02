class ModifyDiscountInfo < ActiveRecord::Migration
  def change
    remove_column :products, :discount
    remove_column :products, :price
    remove_column :products, :specific

    add_column :products, :discount_part1, :string, :default => ""
    add_column :products, :discount_part2, :string, :default => ""
    add_column :products, :discount_part3, :string, :default => ""
    add_column :products, :discount_part4, :string, :default => ""
    add_column :products, :discount_part5, :string, :default => ""
  end
end
