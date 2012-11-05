class User < ActiveRecord::Base
  attr_accessible :email
  attr_accessible :mobile
  attr_accessible :name
  attr_accessible :password
  attr_accessible :password_confirmation
end
