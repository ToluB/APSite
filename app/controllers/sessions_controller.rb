class SessionsController < Devise::SessionsController
  after_filter :user_login_merits, :only =>[:create]
  after_filter :update_user_merits, :only =>[:create]
  after_filter :update_user_rank, :only =>[:create]  
  
  def user_login_merits
    current_user.login_merits
  end
  
  def update_user_merits
    current_user.update_merits
  end
  
   def update_user_rank
     current_user.update_rank
   end
  
end
