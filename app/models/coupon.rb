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
#  mobile     :string(255)
#

class Coupon < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  attr_accessible :status, :password, :mobile

  validates :status, :presence => true,
                     :numericality => {:only_integer => true}
  validates :password, :presence => true,
                       :uniqueness => {:case_sensitive => false}
  validates :mobile, :presence => true

  #validates :user_id, presence: true
  validates :product_id, presence: true
end
