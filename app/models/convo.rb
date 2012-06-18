class Convo < ActiveRecord::Base
  attr_accessible :content, :merits, :subject_id, :title, :user_id
  
  has_many :posts, dependent: :destroy
  belongs_to :subject
  
  default_scope order: 'convos.created_at DESC'
end
# == Schema Information
#
# Table name: convos
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  subject_id :integer
#  merits     :integer
#  title      :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

