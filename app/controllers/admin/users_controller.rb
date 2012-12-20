class Admin::UsersController < ApplicationController
    before_filter :authenticate_super!
    #before_filter :require_admin_user

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            redirect_to admin_users_url
        else
            render "new"
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            redirect_to admin_users_url
        else
            render "edit"
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_users_url
    end
end
