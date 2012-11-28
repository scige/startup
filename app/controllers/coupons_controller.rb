# coding: utf-8

class CouponsController < ApplicationController
    before_filter :require_logined, :only => [:create, :index, :destroy]
    before_filter :require_correct_user, :only => [:destroy]

    def create
        @coupon = Coupon.new
        @coupon.user = current_user
        @product = Product.find(params[:product_id])
        @coupon.product = @product
        @coupon.status = 0
        @coupon.password = get_password
        # 重复尝试5次，超过5次返回错误信息
        (1..5).each do
            if @coupon.save
                flash[:success] = "优惠券发送成功！您可以在我的优惠券中查看详细信息。"
                redirect_to product_path(@product)
                return
            end
        end
        flash[:error] = "优惠券发送失败！请尝试重新发送。"
        redirect_to product_path(@product)
    end

    def index
        allcoupons = current_user.coupons
        @coupons = allcoupons.select do |coupon|
            coupon.status == COUPON_STATUS_UNUSE || coupon.status == COUPON_STATUS_USED
        end
    end

    # 不是真正删除，避免用户删除已使用优惠券的情况
    def destroy
        @coupon = Coupon.find(params[:id])
        # 不能重复删除
        if @coupon and @coupon.status < COUPON_STATUS_DEL
            @coupon.status += COUPON_STATUS_DEL
            @coupon.save
        end
        redirect_to coupons_url
    end

    def unuse
        allcoupons = current_user.coupons
        @coupons = allcoupons.select do |coupon|
            coupon.status == COUPON_STATUS_UNUSE
        end
    end

    def used
        allcoupons = current_user.coupons
        @coupons = allcoupons.select do |coupon|
            coupon.status == COUPON_STATUS_USED
        end
    end

    private

        def require_correct_user
            @user = Coupon.find(params[:id]).user
            unless current_user?(@user)
                redirect_to root_path
            end
        end

        def get_password
            part1 = rand(10000)
            part2 = rand(10000)
            part3 = rand(10000)
            password = "%04d%04d%04d" % [part1, part2, part3]
        end
end
