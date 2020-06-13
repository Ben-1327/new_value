class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @analysis_parts = AnalysisParts.all
    @self_analyses = @analysis_part.self_analyses
  end

end
