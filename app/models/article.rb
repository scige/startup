# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  status       :integer          default(1)
#  raw_id       :integer
#  category     :integer
#  title        :string(255)
#  content      :string(255)
#  thumb        :string(255)
#  thumb_width  :integer
#  thumb_height :integer
#  image        :string(255)
#  like_count   :integer
#  click_count  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :status
  attr_accessible :raw_id
  attr_accessible :category
  attr_accessible :title
  attr_accessible :content
  attr_accessible :thumb
  attr_accessible :thumb_width
  attr_accessible :thumb_height
  attr_accessible :image
  attr_accessible :like_count
  attr_accessible :click_count

  validates :status, :presence => true,
                     :numericality => {:only_integer => true}
end
