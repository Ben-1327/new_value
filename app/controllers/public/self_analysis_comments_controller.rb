class Public::SelfAnalysisCommentsController < ApplicationController

  before_action :login_company?

  def create
    @self_analysis = SelfAnalysis.find(params[:id])
    comment = current_user.self_analysis_comments.new(self_analysis_comment_params)
    comment.self_analysis_id = @self_analysis.id
    comment.save
    redirect_to path
  end

  def destroy
    SelfAnalysisComment.find_by(id: params[:id], self_analysis_id: params[:id]).destroy
    redirect_to path
  end

  private

  def login_company?
    unless current_user.user_type == 0
      flash[:notice] = "あなたのアカウントは個人アカウントではないのでこの機能は利用できません。"
      redirect_to public_user_path(current_user)
    end
  end

  def self_analysis_comment_params
    params.require(:self_analysis_comment).permit(:comment)
  end

end
