# coding: utf-8

class ApplicationController < ActionController::Base
    protect_from_forgery

    helper_method :logined?, :current_user

    protected

    def require_not_logined
        if logined?
            redirect_to root_url
        end
    end

    def require_logined
        unless logined?
            flash[:error] = "您还没有登陆。"
            store_location request.url
            redirect_to login_url
        end
    end

    def require_correct_user
        @user = User.find(params[:id])
        unless current_user?(@user)
            redirect_to root_path
        end
    end

    def require_admin_user
        unless current_user.admin?
            flash[:error] = "管理员才能使用管理后台。"
            redirect_to root_path
        end
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def current_user?(user)
        user == current_user
    end

    def logined?
        current_user != nil
    end

    def login_as(user)
        session[:user_id] = user.id
        @current_user = user
    end

    def logout
        session.delete(:user_id)
        @current_user = nil
    end

    def store_location(path)
        session[:return_to] = path
    end

    def redirect_back_or_default(default)
        redirect_to(session[:return_to] || default)
        session.delete(:return_to)
    end
end

