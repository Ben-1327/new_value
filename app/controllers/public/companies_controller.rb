class Public::CompaniesController < ApplicationController

  def index
    @companies = Company.page(params[:page]).reverse_order.per(12)
  end

  def new
    if user_signed_in? && current_user.user_type == 1 && current_user.company_id.nil?
      @company = Company.new
    elsif user_signed_in? && current_user.user_type == 1 && current_user.company_id.present?
      render :edit
    elsif user_signed_in? && current_user.user_type == 0
      redirect_to public_user_path(current_user), notice: "あなたはビジネスアカウントでないので会社登録はできません"#保存された場合の移動先を指定.
    else
      render 'home/top'
    end
  end

  def create
    if user_signed_in? && current_user.user_type == 1 && current_user.company_id.nil?
      @company = Company.new(company_params)
      if @company.save
        current_user.company_id = @company.id
        current_user.save
    		redirect_to public_user_path(current_user), notice: "会社登録に成功しました!"#保存された場合の移動先を指定.
      else
    		render :new
      end
    elsif user_signed_in? && current_user.user_type == 1 && current_user.company_id.present?
      render :edit
    elsif user_signed_in? && current_user.user_type == 0
      redirect_to public_user_path(current_user), notice: "あなたはビジネスアカウントでないので会社登録はできません"#保存された場合の移動先を指定.
    else
      render 'home/top'
    end

  end

  def edit
    if user_signed_in? && current_user.user_type == 1 && current_user.company_id.present?
      @company = Company.find(params[:id])
    elsif user_signed_in? && current_user.user_type == 1 && current_user.company_id.nil?
      render :new
    elsif user_signed_in? && current_user.user_type == 0
      redirect_to public_user_path(current_user), notice: "あなたはビジネスアカウントでないので会社編集はできません"#保存された場合の移動先を指定.
    else
      render 'home/top'
    end
  end

  def update
    if user_signed_in? && current_user.user_type == 1 && current_user.company_id.present?
      @company = Company.find(params[:id])
      if @company.update(company_params)
    		redirect_to public_user_path(current_user), notice: "会社編集に成功しました!"#保存された場合の移動先を指定.
      else
    		render :edit
      end
    elsif user_signed_in? && current_user.user_type == 1 && current_user.company_id.nil?
      render :new
    elsif user_signed_in? && current_user.user_type == 0
      redirect_to public_user_path(current_user), notice: "あなたはビジネスアカウントでないので会社編集はできません"#保存された場合の移動先を指定.
    else
      render 'home/top'
    end
  end

  def destroy
    if user_signed_in? && current_user.user_type == 1 && current_user.company_id.present?
      @company = Company.find(params[:id])
      if @company.destroy(company_params)
        current_user.update(company_id: nil)
    		redirect_to public_user_path(current_user), notice: "会社削除に成功しました!"#保存された場合の移動先を指定.
      else
    		render :edit
      end
    elsif user_signed_in? && current_user.user_type == 1 && current_user.company_id.nil?
      render :new
    elsif user_signed_in? && current_user.user_type == 0
      redirect_to public_user_path(current_user), notice: "あなたはビジネスアカウントでないので会社削除はできません"#保存された場合の移動先を指定.
    else
      render 'home/top'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name,:hp,:introduction,:icon_img,:tag)
  end

end
