# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = ["美食", "娱乐", "电影", "生活", "酒店"]
category.each do |c|
    Category.create(
        :en_name => Pinyin.t(c, ""),
        :cn_name => c,
        :parent_id => 0
    )
end

district = ["船营区", "昌邑区", "丰满区", "龙潭区"]
district.each do |d|
    District.create(
        :en_name => Pinyin.t(d, ""),
        :cn_name => d,
        :parent_id => 0
    )
end


p1 = Product.new(
    :status     => PRODUCT_STATUS_ON_SHELF,
    :title      => "老马富贵拉面 9折独享",
    :image      => "1.jpg",
    :discount_part1   => "直享",
    :discount_part2   => "9.0",
    :discount_part3   => "折",
    :begin_at   => "2012-11-22",
    :end_at     => "2012-12-31",
    :address    => "北京市昌平区阳坊大都北侧",
    :phone      => "010-58488600",
    :sale_count => 300,
    :pos_x      => 126.507328,
    :pos_y      => 43.825834,
    :content    => "纯正的清真风味，大盘鸡、囊包肉非常独特，烧烤很正宗，服务非常的周到，期待着您的光临。老马富贵拉面 9折（酒水、烧烤除外）；与店内其他优惠活动选一，详询商家58488600。"
)
p1.category = Category.find_by_cn_name("美食");
p1.district = District.find_by_cn_name("船营区");
p1.save

p2 = Product.new(
    :status     => PRODUCT_STATUS_ON_SHELF,
    :title      => "星耀国际商务酒店9折独享优惠",
    :image      => "2.jpg",
    :discount_part1   => "满",
    :discount_part2   => "300",
    :discount_part3   => "减",
    :discount_part4   => "80",
    :begin_at   => "2012-11-22",
    :end_at     => "2012-12-31",
    :address    => "北京市西城区阜成门796号",
    :phone      => "010-8964132",
    :sale_count => 200,
    :pos_x      => 126.510998,
    :pos_y      => 43.827587,
    :content    => "星耀国际商务酒店9折优惠，酒店坐拥干将路优美之处，享受“两路夹一河”及“园林外移”的特色景观。周围小桥流水，粉墙黛瓦，尽显苏州城市的人文历史文化底蕴。酒店以超四星级标准、 五星酒店用品建造，现代专业团队管理，环境幽雅，地铁上盖，彰显现代迷人风格，是国内鲜见结合城市古今文化特色和价值的精品酒店。 "
)
p2.category = Category.find_by_cn_name("酒店");
p2.district = District.find_by_cn_name("昌邑区");
p2.save

#User.create(
#    :name => "scige",
#    :email => "scige@163.com",
#    :password => "dddddd",
#    :password_confirmation => "dddddd"
#)
#
#User.create(
#    :name => "aspring",
#    :email => "apsring@163.com",
#    :password => "dddddd",
#    :password_confirmation => "dddddd"
#)
