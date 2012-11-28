class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer  :status, :default => PRODUCT_STATUS_OFF_SHELF
      t.string   :title
      t.string   :image
      t.float    :discount
      t.datetime :begin_at
      t.datetime :end_at
      t.string   :address
      t.string   :phone
      t.integer  :sale_count
      t.float    :pos_x
      t.float    :pos_y
      t.text     :content
      t.references :category
      t.references :district

      t.timestamps
    end
  end
end
