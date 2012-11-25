class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.integer :status, :default => 0
      t.string :password
      t.references :user
      t.references :product

      t.timestamps
    end

    add_index :coupons, :user_id
    add_index :coupons, :product_id
  end
end
