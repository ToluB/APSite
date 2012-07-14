class Examprefs < ActiveRecord::Base
  attr_accessible :datetaken, :exam_id, :exp1, :score, :taken, :user_id
end
# == Schema Information
#
# Table name: examprefs
#
#  id         :integer         not null, primary key
#  user_id    :string(255)
#  exam_id    :string(255)
#  taken      :boolean
#  datetaken  :datetime
#  score      :integer
#  exp1       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

