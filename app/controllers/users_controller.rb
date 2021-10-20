class UsersController < ApplicationController

    def new 
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id # to keep user logged in 
            redirect_to @user # to redirect to show page 
        else
            render :new
        end 
    end 

    def show 
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
