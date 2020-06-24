class Public::FavoritesController < ApplicationController

  def create
    self_analysis = SelfAnalysis.find(params[:self_analysis_id])
    favorite = current_user.favorites.new(self_analysis_id: self_analysis.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    self_analysis = SelfAnalysis.find(params[:self_analysis_id])
    favorite = current_user.favorites.find_by(self_analysis_id: self_analysis.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
