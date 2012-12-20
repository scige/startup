# coding: utf-8

class ProfilesController < ApplicationController
    before_filter :authenticate_user!
    before_filter :require_correct_user

    def show
        @user = User.find(params[:id])
    end

    private

        def require_correct_user
            @user = User.find(params[:id])
            unless current_user == (@user)
                redirect_to root_path
            end
        end
end
