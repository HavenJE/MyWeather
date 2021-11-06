class LocationSerializer

  # def to_serialized_json(location_object)
  #     location_object.to_json(:include => {
  #         :comment => {:only => [:content]},
  #         :location => {:only => [:title, :content]}
  #     }, :except => [:updated_at, :created_at, :id, :comment_id, :location_id])
  # end
end