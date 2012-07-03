class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :merits, :umerits, :name, :colleges, :current_exams, :past_exams, :gradelevel, :school, :provider, :uid, :rank, :pic_url, :bday, :gpa, :avatar, :remote_avatar_url, :remove_avatar
  
  mount_uploader :avatar, AvatarUploader
  # attr_accessible :title, :body

has_many :posts
has_many :convos
has_many :relationships, foreign_key: 'tracker_id', dependent: :destroy
has_many :tracked_users, through: :relationships, source: :tracked

has_many :reverse_relationships, foreign_key: 'tracked_id', class_name: "Relationship", dependent: :destroy
has_many :trackers, through: :reverse_relationships, source: :tracker

 

#User tracking code

def tracking?(other_user)
  relationships.find_by_tracked_id(other_user.id)
end

def track!(other_user)
  relationships.create!(tracked_id: other_user.id)
end

def untrack!(other_user)
  relationship.find_by_tracked_id(other_user.id).destroy
end

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

