class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        # then that comment is nested to that specific location && we have a location by its id, then attach all comments related to that location 
        if params[:location_id] && @location = Location.find_by_id(params[:location_id]) 
            @comments = @location.comments 
        else 
            @error = "That location does not exist!" if params[:location_id]
            @comments = Comment.all 
        end 
    end 

    def new 
        # if its nested and we find the post 
        if params[:location_id] && @location = Location.find_by_id(params[:location_id]) 
            @comment = @post.comments.build
        else 
            @error = "That location does not exist!" if params[:location_id]
            @comment = Comment.new 
        end
    end 

    def create 
        @comment = current_user.coments.build(coment_params)
        if @comment.save 
            redirect_to coments_path  
        else
            render :new
        end

        def show
            @comment = Comment.find_by(id: params[:id])
        end 

        def edit
            @comment = Comment.find_by(id: params[:id])
        end 

        def update
            @comment = Comment.find_by(id: params[:id])
            if @comment.update(coment_params)
                redirect_to comment_path(@comment)
            end 
        end 
    end 

    private 

    def coment_params 
        params.require(:coment).permit(:title, :content)
    end 
end
