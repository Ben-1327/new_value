ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :remember_created_at, :name, :prefectures, :age,
                :user_batch, :introduction, :values, :icon_img, :header_img, :twitter_link, :tag, :user_type, :company_id, :representative
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :prefectures, :age, :user_batch, :introduction, :values, :icon_img, :header_img, :twitter_link, :tag]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
