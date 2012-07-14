class College < ActiveRecord::Base
  attr_accessible :acceptrate, :gpamed, :name, :region, :satmed, :state, :url, :usnrank
end
# == Schema Information
#
# Table name: colleges
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  region     :string(255)
#  state      :string(255)
#  usnrank    :integer
#  satmed     :integer
#  gpamed     :float
#  acceptrate :float
#  url        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

