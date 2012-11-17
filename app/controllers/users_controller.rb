# coding: utf-8

class UsersController < ApplicationController
    before_filter :require_no_logined, :only => [:new, :create]
    before_filter :require_logined, :only => [:show, :edit, :update]

    def new
        @user = User.new
        if request.referrer.present? and request.referrer != request.url
            store_location request.referrer
        end
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            login_as @user
            redirect_back_or_default root_url
        else
            render "new"
        end
    end

    def show
    end

    def update
        logger.debug "[Debug] #{params}"
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            # redirect_to不能使用flash.now
            flash[:success] = "修改个人信息成功。"
            redirect_to user_url(@user)
        else
            flash.now[:error] = "修改个人信息失败。"
            render "edit"
        end
    end
end
