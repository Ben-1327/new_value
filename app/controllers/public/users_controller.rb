class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @analysis_parts = AnalysisParts.all
  end

end
