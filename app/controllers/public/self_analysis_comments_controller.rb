class Public::SelfAnalysisCommentsController < ApplicationController

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

  def self_analysis_comment_params
    params.require(:self_analysis_comment).permit(:comment)
  end

end
