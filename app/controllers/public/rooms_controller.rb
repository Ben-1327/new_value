class Public::RoomsController < ApplicationController

  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.new(entry_params)
    @entry2.room_id = @room.id
    @entry2.save
    redirect_to public_room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    user = @room.entries.where.not(user_id: current_user.id).first
    @normal_user = User.find(user.user_id)
    company = @normal_user.company
    unless @normal_user.representative == true
      @user = @normal_user
    else
      @user = company
    end
    if Entry.where(user_id:current_user.id, room_id:@room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:user_id)
  end

end
