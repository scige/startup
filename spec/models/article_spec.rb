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

require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
