class Public::FavoritesController < ApplicationController

  def create
    self_analysis = SelfAnalysis.find(params[:self_analysis_id])
    favorite = current_user.favorites.new(self_analysis_id: self_analysis.id)
    favorite.save
    redirect_to path
  end

  def destroy
    self_analysis = SelfAnalysis.find(params[:self_analysis_id])
    favorite = current_user.favorites.find_by(self_analysis_id: self_analysis.id)
    favorite.destroy
    redirect_to path
  end

end
