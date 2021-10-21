class ApplicationController < ActionController::Base

    # All these do give us access to methods in the views 
    helper_method :current_user, :logged_in? 

    private 

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end 

    def logged_in?
        !!session[:user_id]
    end 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end 
end

# line 4 says, if @current_user is already defined it will equal @current_user otherwise, find_by_id from user table. 