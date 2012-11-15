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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
