# coding: utf-8

class UserSessionsController < ApplicationController
    before_filter :require_no_logined, :except => :destroy

    def new
        if request.referrer.present? and request.referrer != request.url
            store_location request.referrer
        end
    end

    def create
        user = User.find_by_name(params[:name])
        if user and user.authenticate(params[:password])
            login_as user
            redirect_back_or_default root_url
        else
            flash[:error] = "账号或密码错误，请重新输入。"
            redirect_to login_url
        end
    end

    def destroy
        logout
        #flash[:success] = "logout success"
        redirect_to root_url
    end
end
