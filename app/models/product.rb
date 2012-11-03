class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :district

  attr_accessible :district_name
  attr_accessible :shop_name
  attr_accessible :product_name
  attr_accessible :image_path
  attr_accessible :cover_name
  attr_accessible :sale_price
  attr_accessible :original_price
  attr_accessible :sale_count
  attr_accessible :overtime_at
  attr_accessible :content
  attr_accessible :category
  attr_accessible :district

  mount_uploader :image_path, ImageUploader
end
