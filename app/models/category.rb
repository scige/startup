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
  has_many :products, dependent: :destroy

  attr_accessible :cn_name
  attr_accessible :en_name
  attr_accessible :parent_id

  validates :cn_name, :presence => true,
                      :uniqueness => {:case_sensitive => false}
  validates :en_name, :presence => true,
                      :uniqueness => {:case_sensitive => false}
  validates :parent_id, :presence => true,
                        :numericality => {:only_integer => true}
end
