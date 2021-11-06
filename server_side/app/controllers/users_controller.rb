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
        # @user = User.find(params[:id]) # if can't find user, it will cause an error!
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id]) # if can't find user, it would return nil 
        redirect_to root_path if !@user # redirect user to home page if is not a user 
    end 

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
