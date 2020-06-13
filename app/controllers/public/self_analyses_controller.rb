class Public::SelfAnalysesController < ApplicationController

  def follow_index
    @follow_users = @user.all_following
    @self_analyses = SelfAnalysis.where(user_id: @follow_users).page(params[:page]).reverse_order.per(12)
  end

  def part_index

  end

end
