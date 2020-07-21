class Public::SearchesController < ApplicationController

  def search
    @select_target = params[:option]
    @how_search = params[:choice]
    @self_analyses = SelfAnalysis.page(params[:page]).reverse_order.per(12)
    if @select_target == "1"
      @users = search_contents(params[:search], @select_target, @how_search)
      render template: 'public/users/index'
    elsif @select_target == "2"
      @companies = search_contents(params[:search], @select_target, @how_search)
      render template: 'public/companies/index'
    else
      @self_analyses = search_contents(params[:search], @select_target, @how_search)
      render template: 'public/self_analyses/all_index'
    end
  end

  def search_contents(search, select_target, how_search)
    if select_target == "1"
      if how_search == "1"
        User.where(['name LIKE ?', "#{search}"]).where(user_type: 0)
      elsif how_search == "2"
        User.where(['name LIKE ?', "#{search}%"]).where(user_type: 0)
      elsif how_search == "3"
        User.where(['name LIKE ?', "%#{search}"]).where(user_type: 0)
      elsif how_search == "4"
        User.where(['name LIKE ?', "%#{search}%"]).where(user_type: 0)
      end
    elsif select_target == "2"
      if how_search == "1"
        Company.where(['name LIKE ?', "#{search}"])
      elsif how_search == "2"
        Company.where(['name LIKE ?', "#{search}%"])
      elsif how_search == "3"
        Company.where(['name LIKE ?', "%#{search}"])
      elsif how_search == "4"
        Company.where(['name LIKE ?', "%#{search}%"])
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
