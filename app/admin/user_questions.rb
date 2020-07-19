ActiveAdmin.register UserQuestion do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :analysis_part_id, :step, :question
  #
  # or
  #
  # permit_params do
  #   permitted = [:analysis_part_id, :step, :question]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
