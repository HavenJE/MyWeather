class LocationsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @location = Location.new 
    end 

    def index  
        if params[:user_id] && @user = User.find_by_id(params[:user_id]) 
            @locations = @user.locations.alpha # alpha is part of our scope method order alphabatically 
        else 
            @error = "That user does not exist!" if params[:user_id]
            @locations = Loction.all.alpha 
        end 
    end

    def create 
        @location = current_user.locations.build(location_params)
        if @location.save 
            redirect_to locations_path  
        else
            render :new
        end
    end 

    def show
        @location = Location.find_by(id: params[:id])
        redirect_to locations_path if !@location 
    end

    private 

    def location_params 
        params.require(:location).permit(:title, :content)
    end 
end
