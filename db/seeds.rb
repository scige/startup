# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(
      :category => "美食",
      :district => "朝阳区",
      :district_name => "朝阳区",
      :shop_name => "金源福城肥牛",
      :product_name => "仅售88元！最高价值252.4元的金源福城肥牛（远大路金源店）2-3人套餐。大厅消费赠送燕京特制啤酒、北京二锅头白酒无限畅饮，全场酸梅汤、豆浆、小布丁、口香糖免费，女士另赠银耳羹1份。",
      :image_path => "1.jpg",
      :cover_name => "2-3人套餐，食材心想，服务周到，交通便利",
      :sale_price => 88,
      :original_price => 252.4,
      :sale_count => 308,
      :overtime_at => "2012-10-18",
      :content => "本单详情"
)

Product.create(
      :category => "酒店",
      :district => "朝阳区",
      :district_name => "朝阳区",
      :shop_name => "轻联富润酒店",
      :product_name => "仅售158元！价值328元的轻联富润酒店住宿1晚（标准双人间/标准大床房2选1），美团券可叠加使用。",
      :image_path => "2.jpg",
      :cover_name => "轻联富润酒店：住宿1晚，美团券可叠加使用",
      :sale_price => 158,
      :original_price => 328,
      :sale_count => 1641,
      :overtime_at => "2012-10-28",
      :content => "本单详情"
)
