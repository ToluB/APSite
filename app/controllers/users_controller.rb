class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  
  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])
    redirect_to users_url
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
  

  
  def avatar
    @user = User.find(params[:user_id])
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
