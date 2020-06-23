class Public::SelfAnalysesController < ApplicationController

  # フォロー中のユーザーの投稿
  def follow_index
    @user = User.find(current_user.id)
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
    @self_analysis = SelfAnalysis.find(params[:id])
    @self_analysis_comment = SelfAnalysisComment.new
    @user = @self_analysis.user
    @user_question = @self_analysis.user_question
    @analysis_part = @user_question.analysis_part
    @self_analysis_comments = @self_analysis.self_analysis_comments
  end

  def new
    @self_analysis = SelfAnalysis.new
    @user_questions = UserQuestion.where(analysis_part_id: AnalysisPart.first.id)
  end

  def edit
    @self_analysis = SelfAnalysis.find(params[:id])
  end

  def create
    @self_analysis = SelfAnalysis.new(self_analysis_params)
    @self_analysis.user_id = current_user.id
    if @self_analysis.save
  		redirect_to public_user_self_analysis_path(current_user.id, @self_analysis), notice: "投稿に成功しました!"#保存された場合の移動先を指定.
    else
  		render :new
    end
  end

  def update
    @self_analysis = SelfAnalysis.find(params[:id])
  	if @self_analysis.update(self_analysis_params)
  		redirect_to public_user_self_analysis_path(current_user.id, @self_analysis), notice: "商品の更新に成功しました!"
  	else
  		render :edit
  	end
  end

  def part_select
    analysis_part = AnalysisPart.find(params[:step_select])
    @steps = UserQuestion.where(analysis_part_id: analysis_part)
    render json: @steps
  end

  def step_select
    @user_question = UserQuestion.find_by(step: (params[:question_put]))
    render json: @user_question
  end

  private

  def self_analysis_params
    params.require(:self_analysis).permit(:user_id, :user_question_id, :answer, :analysis, :range)
  end

end
