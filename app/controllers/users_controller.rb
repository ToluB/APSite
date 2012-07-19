class UsersController < ApplicationController
  before_filter :authenticate_user!

  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  
  def activity
    @user = User.find_by_id(params[:id])
  end
  
  def documents
    @user = User.find_by_id(params[:id])
    @docs = @user.docs
    @convos = @user.convos
    @posts = @user.posts
  end
  
  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])
    redirect_to root_url
  end
  
  
  def tracked
    @title = "Tracked"
    @user = User.find(params[:id])
    @users = @user.tracked_users.page(params[:page]).per_page(20)
    render 'show_track'
  end
  
  def trackers
    @title = "Trackers"
    @user = User.find(params[:id])
    @users = @user.tracked_users.page(params[:page]).per_page(20)
    render 'show_track'
  end
  
  def avatar
    @user = User.find_by_id(params[:id])
  end
  
  # def upmerit
  #     @user = User.find(params[:id])
  #     if demerituser(current_user,1)
  #       @user.update_attribute :merits, @user.merits + 1
  #     end
  #     respond_to do |f|
  #       f.js
  #     end
  #   end
  #   
  #   def demerit
  #     @user = User.find(params[:id])
  #     if demerituser(current_user,2)
  #       @user.update_attribute :merits, @user.merits - 1
  #     end
  #     respond_to do |f|
  #       f.js
  #     end
  #   end
  
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
