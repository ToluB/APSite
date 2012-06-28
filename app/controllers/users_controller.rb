class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by_id(params[:user_id])
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
  
  # def tracking
  #   @title = "Following"
  #   @user = User.find(params[:id])
  #   @users = @user.followed_users
  #   render 'show_follow'
  # end
  # 
  # def trackers
  #   @title = "Followers"
  #   @user = User.find(params[:id])
  #   @users = @user.followers
  #   render 'show_follow'
  # end
  
end
