# coding: utf-8

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  mobile                 :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :mobile, :remember_me

  has_many :coupons, dependent: :destroy

  validates :name,  :presence => {:message=>"请输入用户名"},
                    :uniqueness => {:case_sensitive => false, :message=>"您输入的用户名已经存在"},
                    :format => {:with => /\A\w+\z/, :message=>"请输入字母和数字组成的用户名"},
                    :length => {:in => 4..16, :message=>"请输入4-16个字符的用户名"}
  validates :email, :presence => {:message=>"请输入邮箱"},
                    :uniqueness => {:case_sensitive => false, :message=>"您输入的邮箱已经存在"},
                    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, :message=>"您输入的邮箱格式有误"}
  validates :mobile,:format => {:with => /^1[358][0-9]/, :message=>"请输入国内手机号码"},
                    :length => {:is => 11, :message=>"请输入11位手机号码"}
end
