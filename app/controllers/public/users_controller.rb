class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @analysis_parts = AnalysisPart.all
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)

    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end

  end

  def all_index

  end

  private

  def user_params
  	params.require(:user).permit(:name,:prefectures,:age,:user_batch,:email,:introduction,:values,:icon_img,:header_img,:twitter_link,:tag)
  end

end
