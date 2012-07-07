require 'spec_helper'

describe User do
  describe "#update_rank" do
    it "doesn't update rank if rank is unchanged" do
      user = User.create(name: "Kori", merits: 10)
      user.update_rank
      user.rank.should == "Tabula Rasa"
      user.update_rank
      user.rank.should == "Tabula Rasa"
    end
    
    it "updates rank if user moved to a new level" do
      user = User.create(name:"Kori", merits:10)
      user.update_rank
      user.rank.should == "Tabula Rasa"
      user.update_attribute(:merits, 2000)
      user.update_rank
      user.rank.should == "Sage"
    end
  end
end
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

