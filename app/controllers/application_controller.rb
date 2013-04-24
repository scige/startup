# coding: utf-8

class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :user_access_log

    include SimpleCaptcha::ControllerHelpers

    def user_access_log
      session_id = session[:session_id] || ""
      user_name = (current_super && current_super.name) || (current_writer && current_writer.name) || (current_dealer && current_dealer.name) || (current_user && current_user.name) || ""
      logger.info "#{Time.now}\t[access]\t#{request.request_method}\t#{request.url}\t#{request.referer}\t#{request.remote_ip}\t#{request.user_agent}\t#{session_id}\t#{user_name}"
    end
end

