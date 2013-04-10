class AddMobileForCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :mobile, :string
  end
end
