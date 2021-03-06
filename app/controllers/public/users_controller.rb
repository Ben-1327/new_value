class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @analysis_parts = AnalysisPart.all
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    @questions = []


    if @user.user_type == 1 && @user.company_id.present?
      @company = @user.company
      @representative_user = @company.users.find_by(representative: true)
    end


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

  def index
    @users = User.where(representative: false).page(params[:page]).reverse_order.per(12)
  end

  def jhs_users
    @users = User.where(user_batch: 1, representative: false).page(params[:page]).reverse_order.per(12)
  end

  def normal_users
    @users = User.where(user_batch: 2, representative: false).page(params[:page]).reverse_order.per(12)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
		@user.update(user_params)
    if @user.user_type == 0
      @user.update(company_id: nil)
    end
		redirect_to public_user_path(current_user), notice: "会員情報の編集に成功しました。"
  end


  def confirm
    @company = Company.find(params[:company_id])
  end

  def update_company
    @company = Company.find_by(id: (params[:user][:company_id]))
    if @company.users.count == 0
      current_user.update(representative: true)
    end
    current_user.update(company_id: (params[:user][:company_id]))
    redirect_to public_user_path(current_user), notice: "会社連携に成功しました!"#保存された場合の移動先を指定.
  end

  def remove_company
    @company = Company.find_by(id: current_user.company.id)
    @company_users = @company.users.where.not(id: current_user.id)
    if current_user.representative == true
      if @company_users.count >= 1
        redirect_to public_user_path(current_user), notice: "あなたは代表者なのでメンバー全てが解除するまで解除できません!"#保存された場合の移動先を指定.
      else
        current_user.update(company_id: nil, representative: false)
        redirect_to public_user_path(current_user), notice: "会社連携解除に成功しました!"#保存された場合の移動先を指定.
      end
    else
      current_user.update(company_id: nil)
      redirect_to public_user_path(current_user), notice: "会社連携解除に成功しました!"#保存された場合の移動先を指定.
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name,:prefectures,:age,:user_batch,:email,:introduction,:values,:icon_img,:header_img,:twitter_link,:tag,:user_type)
  end

end
