class Public::SelfAnalysesController < ApplicationController

  # フォロー中のユーザーの投稿
  def follow_index
    @follow_users = @user.all_following
    @self_analyses = SelfAnalysis.where(user_id: @follow_users).page(params[:page]).reverse_order.per(12)
  end

  # 各ユーザーの投稿
  def user_index
    @user = User.find(params[:id])
    @self_analyses = @user.self_analyses.page(params[:page]).reverse_order.per(12)
  end

  # すべてのユーザーの投稿
  def all_index
    @self_analyses = SelfAnalysis.page(params[:page]).reverse_order.per(12)
  end

  # 各編の投稿
  def user_part_index
    @user = User.fond(params[:id])
    @analysis_part = AnalysisPart.find(params[:id])
    @self_analyses = @analysis_part.self_analyses.all
  end

  def show
    @comment = SelfAnalysisComment.new
    @self_analysis = SelfAnalysis.find(params[:id])
    @analysis_part = @self_analysis.analysis_part
  end

end
