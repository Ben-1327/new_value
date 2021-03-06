class Public::MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(message_params)
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/public/rooms/#{@message.room_id}"
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :message, :room_id)
  end

end
