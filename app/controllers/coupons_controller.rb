# coding: utf-8
#require 'rest_client'

class CouponsController < ApplicationController
    before_filter :authenticate_user!, :only => [:create, :index, :destroy]
    before_filter :require_correct_user, :only => [:destroy]

    def create
        @product = Product.find(params[:product_id])
        if !simple_captcha_valid?
            flash[:alert] = "验证码错误，请您重新输入。"
            redirect_to product_path(@product)
            return
        end

        mobile = params[:mobile]
        if !check_mobile?(mobile)
            flash[:alert] = "您输入的手机号码 [#{mobile}] 有误，请重新输入。"
            redirect_to product_path(@product)
            return
        end

        @coupon = Coupon.new
        @coupon.user = current_user
        @coupon.product = @product
        @coupon.status = 0
        @coupon.password = get_password
        # 重复尝试5次，超过5次返回错误信息
        (1..5).each do
            if @coupon.save
                ret_code = send_to_mobile(mobile, @product.title, @coupon.password)
                if ret_code == "0"
                    flash[:notice] = "优惠券已经发送到您的手机中！短信可能有延迟，请您耐心等待。您也可以在【我的信息】中查看优惠券的详细信息。"
                    # TODO: 发送到手机以后，是否应该把手机保存到用户信息中？
                else
                    flash[:notice] = "优惠券已经发送到您的账户中，您可以在【我的信息】中查看优惠券的详细信息。可是在发送到您的手机时发生了错误，您可以在【我的信息】中尝试重新发送。"
                end
                redirect_to product_path(@product)
                return
            end
        end
        flash[:alert] = "优惠券在发送到您的手机时发生了错误！您可以尝试重新发送。"
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
            unless current_user == @user
                redirect_to root_path
            end
        end

        def get_password
            part1 = rand(10000)
            part2 = rand(10000)
            part3 = rand(10000)
            password = "%04d%04d%04d" % [part1, part2, part3]
        end

        def check_mobile?(mobile)
            if mobile and mobile.size == 11 and mobile =~/^1[358][0-9]/
                return true
            end

            return false
        end

        def send_to_mobile(mobile, title, password)
            head = "吉林美："
            title = "您的优惠券『#{title}』，"
            if password.size != 12
                return "-1"
            end
            detail = "密码#{password[0..3]} #{password[4..7]} #{password[8..11]}"
            tail = "【吉林美优惠网】"
            content = head + title + detail + tail
            ret_code = "0"
            if SEND_COUPON_TO_MOBILE
                ret_code = RestClient.get "http://www.smsbao.com/sms", {:params => {:u=>"scige", :p=>"d1075f8c19041c4209a70601ca3543b4", :m=>mobile, :c=>content}}
            end
            # TODO: 诡异的现象：ret_code是"0"的情况下，to_i竟然是200
            logger.info "#{content} -- mobile: [#{mobile}] -- ret_code: [#{ret_code}]"
            return ret_code
        end
end
