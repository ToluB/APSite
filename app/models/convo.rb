class Convo < ActiveRecord::Base
  attr_accessible :content, :merits, :subject_id, :title, :user_id, :sticky,:topic_id
  
  has_many :posts, dependent: :destroy 
  has_many :docs, :as => :docable 
  belongs_to :subject
  belongs_to :user
  
  validates :subject, presence:true
  validates :title, presence:true, length: { minimum: 8}
  validates :content, presence:true, length: { minimum: 15}  
  
  scope :by_latest, order("created_at desc")
  scope :recent, where("created_at >= ?", Time.now-7.days)
  scope :by_merits, order("merits desc")
  scope :by_sticky, order("sticky desc")
  scope :sticky, where("sticky = ?", true)
  #.to_sql returns query performed on database...
    
  default_scope order: 'convos.created_at DESC'
  
  include PgSearch
  pg_search_scope :search, against: [:title, :content],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {posts: [:title, :content]},
    ignoring: :accents
  
  def self.text_search(query)
    if query.present?
         rank = <<-RANK #=> this version wont search posts
                    ts_rank(to_tsvector(title), plainto_tsquery(#{sanitize(query)}))
                 RANK
                 search(query).order("#{rank} desc")
        #         where("content @@ :q or content @@ :q", q: query).order("title desc")
      #Not sure why this version of ranking (ref railscast) not working
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
#  merits     :integer         default(0)
#  title      :string(255)
#  content    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  file       :string(255)
#

