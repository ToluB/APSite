class Collegeprefs < ActiveRecord::Base
  attr_accessible :college_id, :exp, :pref, :user_id
end
# == Schema Information
#
# Table name: collegeprefs
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  college_id :integer
#  pref       :string(255)
#  exp        :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

