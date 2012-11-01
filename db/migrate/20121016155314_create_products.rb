class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :district
      t.string   :district_name
      t.string   :shop_name
      t.string   :product_name
      t.string   :image_path
      t.string   :cover_name
      t.float    :sale_price
      t.float    :original_price
      t.integer  :sale_count
      t.datetime :overtime_at
      t.text     :content
      t.references :category

      t.timestamps
    end
  end
end
