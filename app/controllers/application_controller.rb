class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def demerituser(user,n)
    user.update_attribute :merits, user.merits - n
  end
  
end
