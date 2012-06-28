class SessionsController < Devise::SessionsController
  after_filter :user_login_merits, :only =>[:create]
  after_filter :update_user_merits, :only =>[:create]
  after_filter :update_user_rank, :only =>[:create]
  #after_filter :update_user_rank, :only =>[:create]; update the user's ranking based on number of merits
  
  
  def user_login_merits
    #Currently uses Western time zone; set to get 25 points for logging in on your birthday along with notice HAPPY BIRTHDAY!!
    
    if current_user.last_sign_in_at.in_time_zone(-5).day != Time.now.in_time_zone(-5).day
      current_user.merits += 20
    end
  end
  
  def update_user_merits
    # This method is run on login; it calculates total merits for the user
    # THIS IS THE HEART OF THE MERIT SYSTEM; ABSOLUTELY DO NOT F*** WITH THIS!
    
    # Initializing two dummy variables:
    
      convo_merits = 0
      post_merits = 0   
      
    # personal merits = merits given directly to the user, minus merits given out by the user
    # quality merits = the merits a user has derived from their posts and conversations
    # umerits = quality merits as of a user's last login
    
      personal_merits = current_user.merits - current_user.umerits
    
    # calculating all the "quality merits" a user has ever earned from posting
    
      current_user.convos.each{|convo| convo_merits += convo.merits}
      current_user.posts.each{|post| post_merits += post.merits}
      quality_merits = (convo_merits + post_merits)/5
    
    #we'll save this as "umerits", so we can keep track for the next iteration
      current_user.umerits = quality_merits
      
    # And finally, a user's total merits
      
      current_user.merits = personal_merits + quality_merits
      current_user.save    
  end
  
   def update_user_rank
     
     if current_user.merits < 250
       current_user.rank = "Tabula Rasa"
       
     elsif current_user.merits < 500
       current_user.rank = "Pupil"
       
     elsif current_user.merits < 1000
       current_user.rank = "Scholar"
       
     elsif current_user.merits < 3000
       current_user.rank = "Sage"
       
     elsif current_user.merits < 5000
       current_user.rank = "Elder"
       
     elsif current_user.mreits < 10000
       current_user.rank = "Illuminati"
    
     else
       current_user.rank = "G Whiz"   
     end  
     
     current_user.save
   end
  
end
