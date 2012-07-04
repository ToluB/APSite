class Convo < ActiveRecord::Base
  attr_accessible :content, :merits, :subject_id, :title, :user_id, :file
  
  has_many :posts, dependent: :destroy  
  belongs_to :subject
  belongs_to :user
  
  mount_uploader :file, FileUploader
  
  default_scope order: 'convos.created_at DESC'
  
  include PgSearch
  pg_search_scope :search, against: [:title, :content],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {posts: [:title, :content]},
    ignoring: :accents
  
  def self.text_search(query)
    if query.present?
      search(query)
      #don't know why ranking isn't working, need to fix
      # rank = <<-RANK
      #         ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)}))
      #         RANK
      #         where("to_tsvector('english', content) @@ :q or to_tsvector('english', title) @@ :q", q: query).order("#{rank} desc")
     else
       scoped
     end
  end
  
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

