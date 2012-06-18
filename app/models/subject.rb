class Subject < ActiveRecord::Base
  attr_accessible :area_id
  
  has_many :convos
end
