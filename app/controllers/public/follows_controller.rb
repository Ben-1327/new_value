class Public::FollowsController < ApplicationController

  def follow
    @user = User.find(params[:user_id])
    if @user.user_type == 0
      current_user.follow(@user)
      redirect_to public_user_path(@user)
    end
  end

  def unfollow
    @user = User.find(params[:user_id])
    if @user.user_type == 0
      current_user.stop_following(@user)
      redirect_to public_user_path(@user)
    end
  end

  def follow_list
    @user = User.find(params[:user_id])
    @users = @user.all_following
  end


  def follower_list
    @user = User.find(params[:user_id])
    @users = @user.followers
  end


end
