# coding: utf-8

#coupon status
COUPON_STATUS_UNUSE = 0
COUPON_STATUS_USED = 1
COUPON_STATUS_DEL = 10

#product status
PRODUCT_STATUS_OFF_SHELF = 0
PRODUCT_STATUS_ON_SHELF = 1

#send coupon to mobile open
SEND_COUPON_TO_MOBILE = false

#product discount type
#打折                   discount
#代金券20               discount
#满100减20              discount, price
#满100返20              discount, price
#优惠价28，原价25       discount, price
#买二送一               discount, price
#买商品送赠品           discount, specific
#免费赠送，免费体验     specific
#新品                   specific
DISCOUNT_TYPE_DISCOUNT = 0
DISCOUNT_TYPE_PRICE = 1
DISCOUNT_TYPE_NEW = 2

DISCOUNT_TYPE_NAME = {}
DISCOUNT_TYPE_NAME[DISCOUNT_TYPE_DISCOUNT] = "打折"
DISCOUNT_TYPE_NAME[DISCOUNT_TYPE_PRICE] = "优惠价"
DISCOUNT_TYPE_NAME[DISCOUNT_TYPE_NEW] = "新品"

