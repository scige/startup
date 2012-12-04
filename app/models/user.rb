# coding: utf-8
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  mobile          :string(255)
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class User < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :password
  attr_accessible :password_confirmation
  attr_accessible :email
  attr_accessible :mobile

  has_many :coupons, dependent: :destroy

  has_secure_password

  validates :name,  :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :format => {:with => /\A\w+\z/},
                    :length => {:in => 4..16}
  validates :email, :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
  #validates :mobile,:format => {:with => /^1[358][0-9]/},
  #                  :length => {:is => 11}
  validates :password, :presence => true,
                       :length => {:in => 6..32}
  validates :password_confirmation, :presence => true

  before_save { self.email.downcase! }
end
