class Public::SearchesController < ApplicationController

  def search
    @user_or_analysis = params[:option]
    @how_search = params[:choice]
    @self_analyses = SelfAnalysis.page(params[:page]).reverse_order.per(12)
    if @user_or_analysis == "1"
      @users = search_contents(params[:search], @user_or_analysis, @how_search)
      render template: 'public/users/index'
    else
      @self_analyses = search_contents(params[:search], @user_or_analysis, @how_search)
      render template: 'public/self_analyses/all_index'
    end
  end

  def search_contents(search, user_or_analysis, how_search)
    if user_or_analysis == "1"
      if how_search == "1"
        User.where(['name LIKE ?', "#{search}"])
      elsif how_search == "2"
        User.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "3"
        User.where(['name LIKE ?', "%#{search}"])
      elsif how_search == "4"
        User.where(['name LIKE ?', "%#{search}%"])
      end
    else
      if how_search == "1"
        SelfAnalysis.where(['answer LIKE ?', "#{search}"])
      elsif how_search == "2"
        SelfAnalysis.where(['answer LIKE ?', "#{search}%"])
      elsif how_search == "3"
        SelfAnalysis.where(['answer LIKE ?', "%#{search}"])
      elsif how_search == "4"
        SelfAnalysis.where(['answer LIKE ?', "%#{search}%"])
      end
    end

  end

end
