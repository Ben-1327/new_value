class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @analysis_parts = AnalysisPart.all
    @self_analyses = SelfAnalysis.where(user_id: current_user.id)
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    @user_questions = []

    if @user.user_type == 1 && @user.company_id.present?
      @company = @user.company
    end
    # @analysis_parts.each do |analysis_part|
    #   @self_analyses.each do |self_analysis|
    #     array = [self_analysis, self_analysis.user_question.find_by(analysis_part_id: analysis_part.id)]
    #     @user_questions.push(array)
    #   end
    # end

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
    @users = User.where(user_type: 0).page(params[:page]).reverse_order.per(12)
  end

  def jhs_users
    @users = User.where(user_batch: 1).page(params[:page]).reverse_order.per(12)
  end

  def normal_users
    @users = User.where(user_batch: 2).page(params[:page]).reverse_order.per(12)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
		@user.update(user_params)
		redirect_to public_user_path, notice: "会員情報の編集に成功しました。"
  end

  def select_company
    current_user.update(company_id: nil)
  end

  private

  def user_params
  	params.require(:user).permit(:name,:prefectures,:age,:user_batch,:email,:introduction,:values,:icon_img,:header_img,:twitter_link,:tag,:user_type)
  end

end
