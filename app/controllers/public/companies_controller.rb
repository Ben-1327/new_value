class Public::CompaniesController < ApplicationController

  def index
    @companies = Company.page(params[:page]).reverse_order.per(12)
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name,:HP,:introduction,:icon_img,:email,:tag)
  end

end
