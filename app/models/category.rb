# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  en_name    :string(255)
#  cn_name    :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :products

  attr_accessible :cn_name
  attr_accessible :en_name
  attr_accessible :parent_id
end
