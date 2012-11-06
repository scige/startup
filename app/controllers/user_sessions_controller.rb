class UserSessionsController < ApplicationController
    before_filter :require_no_logined, :except => :destroy

    def new
        if request.referrer.present? and request.referrer != request.url
            store_location request.referrer
        end
    end

    def create
        user = User.find_by_name(params[:name])
        #if user and user.authenticate(params[:password])
        if user and user.password == params[:password]
            login_as user
            redirect_back_or_default root_url
        else
            redirect_to login_url
        end
    end

    def destroy
        logout
        redirect_to root_url
    end
end
