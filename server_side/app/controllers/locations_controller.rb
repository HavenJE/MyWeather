class LocationsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @location = Location.new 
    end 

    def index  
        @Locations = Location.all 
        render json: @locations  

        if params[:user_id] && @user = User.find_by_id(params[:user_id]) 
            @locations = @user.locations.alpha # alpha is part of our scope method order alphabatically 
        else 
            @error = "That user does not exist!" if params[:user_id]
            @locations = Location.all.alpha 
        end 

        # def render_format
        #     @location = Location.all 
        #     render json: @location
        # end 

        # respond_to do |format|
        #     format.html {render :index}
        #     format.json {render :render_format}
        # end 
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
