# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  image       :string(255)
#  discount    :float
#  begin_at    :datetime
#  end_at      :datetime
#  address     :string(255)
#  phone       :string(255)
#  sale_count  :integer
#  pos_x       :float
#  pos_y       :float
#  content     :text
#  category_id :integer
#  district_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
