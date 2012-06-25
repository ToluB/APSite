class UsersController < ApplicationController
  def index
  end

  def show
  end
  
  def vote_up
    @user = User.find(params[:id])
    @user.update_attribute :merits, @user.merits + 1
    respond_to do |f|
      f.js
    end
  end
  
  def vote_down
    @user = User.find(params[:id])
    @user.update_attribute :merits, @user.merits - 1
    respond_to do |f|
      f.js
    end
  end
end
