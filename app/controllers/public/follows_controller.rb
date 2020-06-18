class Public::FollowsController < ApplicationController

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end

  def company_follow
    @user = User.find(params[:user_id])
    current_company.follow(@user)
    redirect_to user_path(@user)
  end

  def company_unfollow
      @user = User.find(params[:user_id])
      current_company.stop_following(@user)
      redirect_to user_path(@user)
  end


  def follow_list
    @user = User.find(params[:id])
    @users = @user.all_following
  end


  def company_follow_list
    @company = Company.find(params[:id])
    @users = @company.all_following
  end


  def follower_list
    @user = User.find(params[:id])
    @users = @user.followers
  end


end
