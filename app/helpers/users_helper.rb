module UsersHelper
  
  def demerituser(user,n)
    user.update_attribute :merits, user.merits - n
  end
  
end
