# == Schema Information
#
# Table name: districts
#
#  id         :integer          not null, primary key
#  en_name    :string(255)
#  cn_name    :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DistrictTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
