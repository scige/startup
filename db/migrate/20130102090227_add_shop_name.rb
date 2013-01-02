class AddShopName < ActiveRecord::Migration
  def change
    add_column :products, :shop_name, :string, :default => ""
  end
end
