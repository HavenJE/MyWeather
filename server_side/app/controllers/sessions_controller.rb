class SessionsController < ApplicationController

    def home
    end 

    def new 
        # @session = Session.new 
    end 

    def destroy
        session.destroy
        redirect_to root_path # root_path is the same to '/' 
    end 

    def create 
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password]) # if you find the user && its authentica
            session[:user_id] = user.id 
            redirect_to user_path(user) # "/users/#{user.id}"
        else 
            flash[:message] = "Incoorect login info, please try again!"
            redirect_to "/login"
        end 
    end 

    def google 
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["first_name"]
            user.password = SecureRandom.hex(6) # this assigns a random password 
        end 
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
        redirect_to '/'
        end 
    end 

    private 

    def auth 
        request.env['omniauth.auth']
    end 

end

