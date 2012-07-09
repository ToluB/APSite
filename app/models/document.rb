class Document < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :convo_id, :post_id
  
  # belongs_to :user
  # belongs_to :post
  # belongs_to :id
  
  
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
#  convo_id    :string(255)
#  post_id     :string(255)
#

