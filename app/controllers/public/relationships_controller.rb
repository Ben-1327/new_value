class Public::RelationshipsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
		redirect_back(fallback_location: root_path)
  end

	def destroy
    user = User.find(params[:user_id])
		current_user.unfollow(user)
		redirect_to request.referer
	end

	def follower
		user = User.find(params[:user_id])
		@users = user.follower_user
	end

	def followed
		user = User.find(params[:user_id])
		@users = user.following_user
	end

end
