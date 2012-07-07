class Exam < ActiveRecord::Base
  attr_accessible :lastadm, :name, :nextadm, :passrt, :subject_id, :url
end
# == Schema Information
#
# Table name: exams
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  subject_id :integer
#  nextadm    :datetime
#  lastadm    :datetime
#  passrt     :integer
#  url        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

