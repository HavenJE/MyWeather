class SessionsController < ApplicationController

    def home
    end 

    def new 
        @session = Session.new 
    end 

    def create 
        # @session = Session.new 
    end 

    def destroy
        session.destroy
        redirect_to root_path # root_path is the same to '/' 
    end 
end

