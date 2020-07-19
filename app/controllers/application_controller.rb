class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery

  protected
  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when Company
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :user
      root_path
    when :company
      root_path
    end
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type,:name,:prefectures,:age,:user_batch,:email])
   devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
   devise_parameter_sanitizer.permit(:account_update,keys:[:user_type,:name,:prefectures,:age,:user_batch,:email,:introduction,:values,:icon_img,:header_img,:twitter_link,:tag])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end

end
