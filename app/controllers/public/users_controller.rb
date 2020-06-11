class Public::UsersController < ApplicationController

  def show
    @analysis_parts = AnalysisParts.all
  end

end
