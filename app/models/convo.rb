class Convo < ActiveRecord::Base
  attr_accessible :content, :merits, :subject_id, :title, :user_id
  
  
end
