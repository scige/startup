# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  shop_name      :string(255)
#  product_name   :string(255)
#  image_path     :string(255)
#  cover_name     :string(255)
#  sale_price     :float
#  original_price :float
#  sale_count     :integer
#  overtime_at    :datetime
#  content        :text
#  category_id    :integer
#  district_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :district

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
