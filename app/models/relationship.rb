class Relationship < ActiveRecord::Base
  attr_accessible :tracked_id, :tracker_id
  
  belongs_to :tracker, class_name: "User"
  belongs_to :tracked, class_name: "User"
  
  validates :tracker_id, presence: true
  validates :tracked_id, presence: true
end
# == Schema Information
#
# Table name: relationships
#
#  id         :integer         not null, primary key
#  tracked_id :integer
#  tracker_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

