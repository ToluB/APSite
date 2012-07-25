class Subject < ActiveRecord::Base
  attr_accessible :name
  
  has_many :topics, dependent: :destroy 
  has_many :convos
  has_many :posts, through: :convos
end
# == Schema Information
#
# Table name: subjects
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  name       :string(255)
#

