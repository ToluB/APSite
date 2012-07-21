class Topic < ActiveRecord::Base
  attr_accessible :name, :subject_id
  
  belongs_to :subject
  has_many :convos
  has_many :posts, through: :convos
end
