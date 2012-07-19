class Post < ActiveRecord::Base
  attr_accessible :content, :convo_id, :merits, :skill, :title, :user_id, :parent_id, :convo
  
  has_ancestry
  belongs_to :convo
  belongs_to :user
  has_many :docs, :as => :docable
    
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  convo_id   :integer
#  merits     :integer         default(0)
#  skill      :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  ancestry   :string(255)
#  file       :string(255)
#

