# == Schema Information
#
# Table name: coupons
#
#  id         :integer          not null, primary key
#  status     :integer          default(0)
#  password   :string(255)
#  user_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Coupon do
  pending "add some examples to (or delete) #{__FILE__}"
end
