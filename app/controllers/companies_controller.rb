# coding: utf-8

class CompaniesController < ApplicationController
    def update_coupon
        logger.debug "[DEBUG] #{params}"
        coupon = Coupon.find_by_password(params[:couponcode])
        if nil == coupon
            flash[:error] = "无效的优惠券密码，请检查后再重试。"
        elsif coupon.status != COUPON_STATUS_UNUSE
            flash[:error] = "此优惠券已经使用过了，请检查后再重试。"
        else
            coupon.status = COUPON_STATUS_USED
            if coupon.save
                flash[:success] = "优惠券验证通过，谢谢您的使用。"
            else
                flash[:error] = "无效的优惠券密码，请检查后再重试。"
            end
        end
        redirect_to checkcoupon_url
    end
end
