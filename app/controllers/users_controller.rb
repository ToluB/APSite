class UsersController < ApplicationController
  def index
  end

  def show
  end
  
  def upmerit
    @user = User.find(params[:id])
    demerituser(current_user,1)
    @user.update_attribute :merits, @user.merits + 1
    respond_to do |f|
      f.js
    end
  end
  
  def demerit
    @user = User.find(params[:id])
    demerituser(current_user,2)
    @user.update_attribute :merits, @user.merits - 1
    respond_to do |f|
      f.js
    end
  end
end
