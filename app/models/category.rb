class Category < ActiveRecord::Base
  has_many :products

  attr_accessible :cn_name
  attr_accessible :en_name
  attr_accessible :parent_id
end
