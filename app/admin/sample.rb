ActiveAdmin.register Sample do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :user_id, 
    :reading_id, 
    :sample_id, 
    :location_id, 
    :sample_gp, 
    :reading_number, 
    :bacterial_mean, 
    :bacterial_standard_deviation

    index do
        column 'Reading ID', :reading_id
        column 'Sample ID', :sample_id
        column 'Location ID', :location_id
        column 'Sample No (1-4)', :sample_gp
        column :reading_number
        column :bacterial_mean
        column :bacterial_standard_deviation
        actions
    end
end
