# coding: utf-8

class User < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :password
  attr_accessible :password_confirmation
  attr_accessible :email
  attr_accessible :mobile

  has_secure_password

  validates :name,  :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :format => {:with => /\A\w+\z/},
                    :length => {:in => 3..20}
  validates :email, :presence => true,
                    :uniqueness => {:case_sensitive => false},
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
  validates :password, :presence => true,
                       :length => {:minimum => 6}
  validates :password_confirmation, :presence => true
end
