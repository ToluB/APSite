class RelationshipsController < ApplicationController
  #before_filter :signed_in_user

  def create
    @user = User.find(params[:relationship][:tracked_id])
    current_user.track!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.untrack!(@user)
    redirect_to @user
  end
end