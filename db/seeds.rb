# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = ["美食", "娱乐", "电影", "酒店"]
category.each do |c|
    Category.create(
          :en_name => Pinyin.t(c, ""),
          :cn_name => c,
          :parent_id => 0
    )
end

district = ["朝阳区", "海淀区", "西城区"]
district.each do |d|
    District.create(
          :en_name => Pinyin.t(d, ""),
          :cn_name => d,
          :parent_id => 0
    )
end

c1 = Category.find_by_cn_name("美食");
d1 = District.find_by_cn_name("朝阳区");
Product.create(
      :shop_name => "金源福城肥牛",
      :product_name => "仅售88元！最高价值252.4元的金源福城肥牛（远大路金源店）2-3人套餐。大厅消费赠送燕京特制啤酒、北京二锅头白酒无限畅饮，全场酸梅汤、豆浆、小布丁、口香糖免费，女士另赠银耳羹1份。",
      :image_path => "1.jpg",
      :cover_name => "2-3人套餐，食材心想，服务周到，交通便利",
      :sale_price => 88,
      :original_price => 252.4,
      :sale_count => 308,
      :overtime_at => "2012-10-18",
      :content => "本单详情",
      :category => c1,
      :district => d1
)

c2 = Category.find_by_cn_name("酒店");
d2 = District.find_by_cn_name("海淀区");
Product.create(
      :shop_name => "轻联富润酒店",
      :product_name => "仅售158元！价值328元的轻联富润酒店住宿1晚（标准双人间/标准大床房2选1），美团券可叠加使用。",
      :image_path => "2.jpg",
      :cover_name => "轻联富润酒店：住宿1晚，美团券可叠加使用",
      :sale_price => 158,
      :original_price => 328,
      :sale_count => 1641,
      :overtime_at => "2012-10-28",
      :content => "本单详情",
      :category => c2,
      :district => d2
)

