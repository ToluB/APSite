module TopicsHelper
  def is_active?(topic_id)
      "active" if params[:topic_id] == topic_id
    end
end
