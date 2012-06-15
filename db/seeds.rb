# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Convo.destroy_all
Post.destroy_all

5.times do
  title = (0...20).map{65.+(rand(25)).chr}.join
  content = (0...90).map{65.+(rand(25)).chr}.join
  merits = rand(0..100)

c = Convo.create :title => title,
                :content => content,
                :merits => merits
          end

20.times do
  title = (0...20).map{65.+(rand(25)).chr}.join
  content = (0...90).map{65.+(rand(25)).chr}.join
  merits = rand(0..100)
  convo_id = rand(1..5)

p = Post.create :title => title,
                :content => content,
                :merits => merits,
                :convo_id => convo_id
                
          end


#(0...8).map{65.+(rand(25)).chr}.join #=> generate random 8 letter title
#(0...90).map{65.+(rand(25)).chr}.join #=> generate random 90 letter post
#rand(0..100) #=> generate random number 0 - 100 for points

