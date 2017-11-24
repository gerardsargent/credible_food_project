ActiveAdmin.register Sample, as: 'StandardDeviationReport' do
    menu label: 'Standard Deviation Data'
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

# controller do
#     def scoped_collection
#         super.includes :reading # prevents N+1 queries to your database
#     end
# end

index do
    column "Sample" do |sample|
        link_to sample.id, admin_reading_samples_path(sample)
    end
    column "Reading", :reading_id, sortable: 'readings.organisation'
    column "Bacteria", :bacterial_standard_deviation
    column "Actinobacteria", :actinobacterial_standard_deviation
    column "Fungi", :fungi_standard_deviation
    column "Oomycetes", :oomycetes_standard_deviation
    column "Flagellate", :flagellate_standard_deviation
    column "Amoebae", :amoebae_standard_deviation
    column "Ciliates", :ciliates_standard_deviation
end

filter :bacterial_standard_deviation
filter :actinobacterial_standard_deviation
filter :fungi_standard_deviation
filter :oomycetes_standard_deviation
filter :flagellate_standard_deviation
filter :amoebae_standard_deviation
filter :ciliates_standard_deviation

end

# Create a new page
# ActiveAdmin.register_page "Calendar" do
#     content do
#       render partial: '_reading_header'
#     end
#   end