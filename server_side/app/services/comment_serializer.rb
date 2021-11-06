class CommentSerializer
    def self.to_serialized_json(comment_object)
        comment_object.to_json(:only => [:content])
    end
  end