# coding: utf-8

class CouponsController < ApplicationController
    before_filter :require_logined, :only => [:get, :create, :index, :destroy]
    before_filter :require_correct_user, :only => [:destroy]

    def get
        @coupon = Coupon.new
        @coupon.product = Product.find(params[:id])
    end

    def create
        @coupon = Coupon.new
        @coupon.user = current_user
        @product = Product.find(params[:coupon][:product_id])
        @coupon.product = @product
        @coupon.status = 0
        @coupon.password = Time.now.to_s
        if @coupon.save
            flash[:success] = "优惠券发送成功！您可以在我的优惠券中查看详细信息。"
        end
        redirect_to product_path(@product)
    end

    def index
        @coupons = current_user.coupons
    end

    def destroy
        @coupon = Coupon.find(params[:id])
        @coupon.destroy
        redirect_to coupons_url
    end

    private

        def require_correct_user
            @user = Coupon.find(params[:id]).user
            unless current_user?(@user)
                redirect_to root_path
            end
        end
end
