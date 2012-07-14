class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :merits, :umerits, :name, :colleges, :current_exams, :past_exams, :gradelevel, :school, :provider, :uid, :rank, :pic_url, :bday, :gpa, :avatar, :remote_avatar_url, :remove_avatar, :thumbnail
  
  mount_uploader :avatar, FileUploader
  # attr_accessible :title, :body

has_many :posts
has_many :convos
has_many :relationships, foreign_key: 'tracker_id', dependent: :destroy
has_many :tracked_users, through: :relationships, source: :tracked

has_many :reverse_relationships, foreign_key: 'tracked_id', class_name: "Relationship", dependent: :destroy
has_many :trackers, through: :reverse_relationships, source: :tracker

 #Facebook oauth code

 def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
   user = User.where(:provider => auth.provider, :uid => auth.uid).first
   unless user
     user = User.create(name:auth.extra.raw_info.name,
                          provider:auth.provider,
                          uid:auth.uid,
                          email:auth.info.email,
                          password:Devise.friendly_token[0,20],
                          pic_url:auth.info.image,
                          bday:auth.info.user_birthday
                          )
   end
   user
 end

 def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end
 
# User merits and rank updating => called for new sessions

def login_merits
  #Currently uses Western time zone; set to get 25 points for logging in on your birthday along with notice HAPPY BIRTHDAY!!
  
  if self.last_sign_in_at.in_time_zone(-5).day != Time.now.in_time_zone(-5).day
    self.merits += 20
  end
end

def update_rank
  ranks = ["Tabula Rasa", "Pupil", "Scholar", "Sage", "Elder", "Illuminati", "G Whiz"]
  rank_level = [250, 500, 1000, 3000, 5000, 10000]
  
   if merits < rank_level[0]
     rank = ranks[0]
   elsif merits < rank_level[1]
    rank = ranks[1]
   elsif merits < rank_level[2]
     rank = ranks[2]
   elsif merits < rank_level[3]
     rank = ranks[3]
   elsif merits < rank_level[4]
     rank = ranks[4]
   elsif merits < rank_level[5]
     rank = ranks[5]
   else
     rank = ranks[6]
   end
   update_attribute(:rank, rank)
end

def update_merits
  # This method is run on login; it calculates total merits for the user
  # THIS IS THE HEART OF THE MERIT SYSTEM; ABSOLUTELY DO NOT F*** WITH THIS!
  
  # Initializing two dummy variables:  
    convo_merits = 0
    post_merits = 0   
    
  # personal merits = merits given directly to the user, minus merits given out by the user
  # quality merits = the merits a user has derived from their posts and conversations
  # umerits = quality merits as of a user's last login
    personal_merits = self.merits - self.umerits
    
  # calculating all the "quality merits" a user has ever earned from posting
    self.convos.each{|convo| convo_merits += convo.merits}
    self.posts.each{|post| post_merits += post.merits}
    quality_merits = (convo_merits + post_merits)/5
    
  #we'll save this as "umerits", so we can keep track for the next iteration
    self.umerits = quality_merits
  # And finally, a user's total merits
    self.merits = personal_merits + quality_merits
    self.save    
end

#User tracking code #=> This is used for "tracking" code that would assist implementation of a friend/follow system for users

def tracking?(other_user)
  relationships.find_by_tracked_id(other_user.id)
end

def track!(other_user)
  relationships.create!(tracked_id: other_user.id)
end

def untrack!(other_user)
  relationship.find_by_tracked_id(other_user.id).destroy
end

def feed
  Post.from_users_tracked_by(self)
end

def self.from_users_tracked_by(user)
  tracked_user_ids = "SELECT tracked_id FROM relationships WHERE tracker_id = :user_id"
  where("user_id IN (#{tracked_user_ids}) OR user_id = :user_id", user_id: user.id)
end



end# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  school                 :string(255)
#  colleges               :string(255)
#  past_exams             :string(255)
#  current_exams          :string(255)
#  merits                 :integer         default(0)
#  umerits                :integer         default(0)
#  gradelevel             :integer
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  provider               :string(255)
#  uid                    :string(255)
#  rank                   :string(255)
#  pic_url                :string(255)
#

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  school                 :string(255)
#  colleges               :string(255)
#  past_exams             :string(255)
#  current_exams          :string(255)
#  merits                 :integer         default(0)
#  umerits                :integer         default(0)
#  gradelevel             :integer
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  provider               :string(255)
#  uid                    :string(255)
#  rank                   :string(255)
#  pic_url                :string(255)
#  bday                   :datetime
#  location               :string(255)
#  avatar                 :string(255)
#  gpa                    :float
#

