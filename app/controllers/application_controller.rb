class ApplicationController < ActionController::Base
    protect_from_forgery

    helper_method :logined?, :current_user

    protected

    def require_logined
        unless logined?
            store_location nil
            redirect_to login_url
        end
    end

    def require_no_logined
        if logined?
            redirect_to root_url
        end
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logined?
        current_user != nil
    end

    def login_as(user)
        session[:user_id] = user.id
        @current_user = user
    end

    def logout
        session[:user_id] = nil
        @current_user = nil
    end

    def store_location(path)
        session[:return_to] = path
    end

    def redirect_back_or_default(default)
        redirect_to(session[:return_to] || default)
        session[:return_to] = nil
    end
end

