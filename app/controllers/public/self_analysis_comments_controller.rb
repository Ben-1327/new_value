class Public::SelfAnalysisCommentsController < ApplicationController

  before_action :login_company?

  def create
    @self_analysis = SelfAnalysis.find(params[:self_analysis_id])
    comment = current_user.self_analysis_comments.new(self_analysis_comment_params)
    comment.self_analysis_id = @self_analysis.id
    comment.save
    redirect_to public_user_self_analysis_path(@self_analysis.user, @self_analysis)
  end

  def destroy
    @self_analysis = SelfAnalysis.find(params[:self_analysis_id])
    SelfAnalysisComment.find_by(self_analysis_id: params[:self_analysis_id], id: params[:id]).destroy
    redirect_to public_user_self_analysis_path(@self_analysis.user, @self_analysis)
  end

  private

  def login_company?
    unless current_user.representative == false
      flash[:notice] = "あなたのアカウントは個人アカウントではないのでこの機能は利用できません。"
      redirect_to public_user_path(current_user)
    end
  end

  def self_analysis_comment_params
    params.permit(:comment)
  end

end
