class ApplicationController < ActionController::Base
  protect_from_forgery
    
  def demerituser(user,n)
    if user.merits < n
      flash[:alert]= "You need #{n} merits to perform this action"
      redirect_to nil and return flash[:notice]="You need #{n} merits biotch"
    else
      user.update_attribute :merits, user.merits - n
    end
  end

end