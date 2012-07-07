class Document < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
end
# == Schema Information
#
# Table name: documents
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

