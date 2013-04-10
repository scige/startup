# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  status         :integer          default(0)
#  title          :string(255)
#  image          :string(255)
#  begin_at       :datetime
#  end_at         :datetime
#  address        :string(255)
#  phone          :string(255)
#  sale_count     :integer
#  pos_x          :float
#  pos_y          :float
#  content        :text
#  category_id    :integer
#  district_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  discount_type  :integer          default(0)
#  discount_part1 :string(255)      default("")
#  discount_part2 :string(255)      default("")
#  discount_part3 :string(255)      default("")
#  discount_part4 :string(255)      default("")
#  discount_part5 :string(255)      default("")
#  shop_name      :string(255)      default("")
#

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :district

  has_many :coupons, dependent: :destroy

  attr_accessible :status
  attr_accessible :title
  attr_accessible :shop_name
  attr_accessible :image
  attr_accessible :discount_type
  attr_accessible :discount_part1
  attr_accessible :discount_part2
  attr_accessible :discount_part3
  attr_accessible :discount_part4
  attr_accessible :discount_part5
  attr_accessible :begin_at
  attr_accessible :end_at
  attr_accessible :address
  attr_accessible :phone
  attr_accessible :sale_count
  attr_accessible :pos_x
  attr_accessible :pos_y
  attr_accessible :content

  validates :status, :presence => true,
                     :numericality => {:only_integer => true}

  validates :category_id, presence: true
  validates :district_id, presence: true

  mount_uploader :image, ImageUploader
end
