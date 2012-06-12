class Post < ActiveRecord::Base
  attr_accessible :content, :convo_id, :merits, :skill, :title, :user_id, :parent_id
  
  has_ancestry
end
