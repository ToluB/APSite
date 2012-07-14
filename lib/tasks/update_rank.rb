# desc "Update ranks for all users (simulate login)"
# namespace :tolu do
#   task update_rank: do
#     User.each do |user|
#       user.update_rank
#     def update_user_rank
# 
#        if current_user.merits < 250
#          current_user.rank = "Tabula Rasa"
# 
#        elsif current_user.merits < 500
#          current_user.rank = "Pupil"
# 
#        elsif current_user.merits < 1000
#          current_user.rank = "Scholar"
# 
#        elsif current_user.merits < 3000
#          current_user.rank = "Sage"
# 
#        elsif current_user.merits < 5000
#          current_user.rank = "Elder"
# 
#        elsif current_user.mreits < 10000
#          current_user.rank = "Illuminati"
# 
#        else
#          current_user.rank = "G Whiz"   
#        end  
# 
#        current_user.save
#      end
#   end
# end
