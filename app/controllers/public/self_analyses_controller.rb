class Public::SelfAnalysesController < ApplicationController

  # フォロー中のユーザーの投稿
  def follow_index
    @user = User.find(params[:id])
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
    @analysis_part = @self_analysis.analysis_part
  end

  def new
    @self_analysis = SelfAnalysis.new
  end

  def edit
    @self_analysis = SelfAnalysis.find(params[:id])
  end

  def create
    @self_analysis = SelfAnalysis.new(self_analysis_params)
    if @item.save
  		redirect_to path, notice: "商品の作成に成功しました!"#保存された場合の移動先を指定.
    else
  		render :new
    end
  end

  def update
    @self_analysis = SelfAnalysis.find(params[:id])
  	if @self_analysis.update(self_analysis_params)
  		redirect_to path, notice: "商品の更新に成功しました!"
  	else
  		render :edit
  	end
  end

  def part_select
    analysis_part = AnalysisPart.find(params[:part_select])
    user_questions = UserQuestion.where(analysis_part_id: analysis_part)
    @steps = user_questions.all
  end

  def step_select
    analysis_part = AnalysisPart.find(params[:part_select])
    @user_question = UserQuestion.find_by(step: (params[:step_select]), analysis_part_id: analysis_part)
  end

  private

  def self_analysis_params
    params.require(:self_analysis).permit(:genre_id,:name,:non_taxed_price,:introduction,:item_image,:is_valid)
  end

end
