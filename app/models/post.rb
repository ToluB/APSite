class Post < ActiveRecord::Base
  attr_accessible :content, :convo_id, :merits, :skill, :title, :user_id
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
#  merits     :integer
#  skill      :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

