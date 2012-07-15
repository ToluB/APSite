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

s1=Subject.create :name => "Economics" 
s2=Subject.create :name => "Calculus" 
s3=Subject.create :name => "History" 
s4=Subject.create :name => "Psychology"
s5=Subject.create :name => "Environmental Science" 

100.times do
  title = (0...20).map{65.+(rand(25)).chr}.join
  content = (0...90).map{65.+(rand(25)).chr}.join
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
  title = (0...20).map{65.+(rand(25)).chr}.join
  content = (0...90).map{65.+(rand(25)).chr}.join
  merits = rand(0..100)
  convo = rand(1..250)
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

