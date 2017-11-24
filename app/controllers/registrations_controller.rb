class RegistrationsController < Devise::RegistrationsController
    
      private
    
      def sign_up_params
        params.require(:user).permit(:name, :email, :password, :address_line_1, :address_line_2, :city, :state_province_region, :zip_postcode, :country, :telephone, :mobile)
      end
    
      def account_update_params
        params.require(:user).permit(:name, :email, :password, :address_line_1, :address_line_2, :city, :state_province_region, :zip_postcode, :country, :telephone, :mobile)
      end
    end