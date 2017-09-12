ActiveAdmin.register Reading do
ActiveAdmin.register Sample do
    belongs_to :reading
end
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

permit_params :client, :organisation, :location, 
tags_attributes: [:samples, :_true]

index do
    column :client
    column :organisation
    column "Sample History" do |sample|
        link_to "Details", admin_reading_samples_path(sample)
end
    column :location
    actions
end

end
