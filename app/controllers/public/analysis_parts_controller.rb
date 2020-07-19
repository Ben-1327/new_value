class Public::AnalysisPartsController < ApplicationController

  before_action :login_company?

  private

  def login_company?
    unless current_user.user_type == 0
      flash[:notice] = "あなたのアカウントは個人アカウントではないのでこの機能は利用できません。"
      redirect_to public_user_path(current_user)
    end
  end

end
