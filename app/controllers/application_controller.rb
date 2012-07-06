class ApplicationController < ActionController::Base
  protect_from_forgery
    
  def demerituser(user,n)
    if user.merits < n
      flash[:notice]= "You need #{n} merits to perform this action"
      return false
    else
      user.update_attribute :merits, user.merits - n
      return true
    end
  end
  
  def upmerituser(user,n)
      user.update_attribute :merits, user.merits + n
  end

end