# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Convo.destroy_all
Post.destroy_all
User.destroy_all

u1=User.create :email => "exam@exam.com", :name => "John Doe", :password => "password", :merits => rand(0..100)
u2=User.create :email => "exam2@exam.com", :name => "Jane Doe", :password => "password", :merits => rand(0..100)
u3=User.create :email => "exam3@exam.com", :name => "Jimmy Doe", :password => "password", :merits => rand(0..100)
u4=User.create :email => "exam4@exam.com", :name => "Joseph Doe", :password => "password", :merits => rand(0..100)
u5=User.create :email => "exam5@exam.com", :name => "Jacob Doe", :password => "password", :merits => rand(0..100)

s1=Subject.create :name => "Art/Humanities"
s2=Subject.create :name => "Languages/Lit"
s3=Subject.create :name => "Mathematics" 
s4=Subject.create :name => "Natural Science" 
s5=Subject.create :name => "Social Science" 
s6=Subject.create :name => "Other"

t1=Topic.create :name=>"Calculus", :subject_id => 1
t2=Topic.create :name=>"Computer Science", :subject_id => 1
t3=Topic.create :name=>"Statistics", :subject_id => 1

t4=Topic.create :name=>"Biology", :subject_id => 2
t5=Topic.create :name=>"Chemistry", :subject_id => 2
t6=Topic.create :name=>"Environmental Science", :subject_id => 2
t7=Topic.create :name=>"Physics", :subject_id => 2

t8=Topic.create :name=>"Economics", :subject_id => 3
t9=Topic.create :name=>"Psychology", :subject_id => 3
t10=Topic.create :name=>"Government", :subject_id => 3

t11=Topic.create :name=>"Art and Music", :subject_id => 4
t12=Topic.create :name=>"European History", :subject_id => 4
t13=Topic.create :name=>"U.S. History", :subject_id => 4
t14=Topic.create :name=>"World History", :subject_id => 4

t15=Topic.create :name=>"English", :subject_id => 5
t16=Topic.create :name=>"French", :subject_id => 5
t17=Topic.create :name=>"Spanish", :subject_id => 5
t18=Topic.create :name=>"German", :subject_id => 5
t19=Topic.create :name=>"Italian", :subject_id => 5
t20=Topic.create :name=>"Japanese", :subject_id => 5







100.times do
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  merits = rand(0..100)
  user = rand(1..5)
  subject = rand (1...5)

c = Convo.create :title => title,
                :content => content,
                :merits => merits,
                :user_id => user,
                :subject_id => subject
          end

600.times do
  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraph
  merits = rand(0..100)
  convo = rand(1..100)
  user = rand(1..5)

p = Post.create :title => title,
                :content => content,
                :merits => merits,
                :convo_id => convo,
                :user_id => user
                
          end


#(0...8).map{65.+(rand(25)).chr}.join #=> generate random 8 letter title
#(0...90).map{65.+(rand(25)).chr}.join #=> generate random 90 letter post
#rand(0..100) #=> generate random number 0 - 100 for points

