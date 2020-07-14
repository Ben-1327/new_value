class Public::CompaniesController < ApplicationController

  def index
    @companies = Company.page(params[:page]).reverse_order.per(12)
  end

  def new
    @company = Comapny.new(current_user)
  end

  def create
    if user_sign_in? && current_user.user_type == 1 && current_user.campany_id.nil?
      @company = Company.new(company_params)
      if @company.save
    		redirect_to public_user_path(current_user), notice: "アカウント連携に成功しました!"#保存された場合の移動先を指定.
      else
    		render :new
      end
    elsif user_sign_in? && current_user.user_type == 1 && current_user.campany_id.present?
      render :edit
    elsif user_sign_in? && current_user.user_type == 0
      redirect_to public_user_path(current_user), notice: "あなたはビジネスアカウントでないので会社登録はできません"#保存された場合の移動先を指定.
    else
      render 'home/top'
    end

  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    if user_sign_in? && current_user.user_type == 1 && current_user.campany_id.present?
      @company = Company.find(params[:id])
      if @company.update
    		redirect_to public_user_path(current_user), notice: "アカウント連携に成功しました!"#保存された場合の移動先を指定.
      else
    		render :edit
      end
    elsif user_sign_in? && current_user.user_type == 1 && current_user.campany_id.nill?
      render :new
    elsif user_sign_in? && current_user.user_type == 0
      redirect_to public_user_path(current_user), notice: "あなたはビジネスアカウントでないので会社登録はできません"#保存された場合の移動先を指定.
    else
      render 'home/top'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name,:hp,:introduction,:icon_img,:tag)
  end

end
