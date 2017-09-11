ActiveAdmin.register User do
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
permit_params :name, :email, :password, :address_line_1, :address_line_2, :city, :state_province_region, :zip_postcode, :country, :telephone, :mobile, :roles

    index do
        column :email
        column :name
        column :roles
        column :country
        actions
    end



    # #remove unnesecary UI elements and name report
    # config.clear_action_items!
    # actions :all, except: [:edit, :destroy]
    # config.batch_actions = false
    # menu :label => proc{ "Employee Report" }

    # Narrow filters on right hand side of screen to useful list 
    filter :name
    filter :email
    filter :city
    filter :zip_postcode

    # Specify scope buttons (top left of screen above index list)
    scope :all
    scope :Jersey do |e|
        e.where("country = 'JE'")
    end

    

    # Creates a separate page in ActiveAdmin
    ActiveAdmin.register_page "Calendar" do
        content do
            para "Hello World"
        end
    end

end
