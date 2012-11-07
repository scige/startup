#encoding: utf-8

require 'spec_helper'

describe "homepage" do

  it "visit homepage" do
    visit '/'
    page.should have_content("今日优惠")
    page.should have_content("登录")
    page.should have_content("注册")
    page.should have_content("分类")
    page.should have_content("区域")
  end

end
