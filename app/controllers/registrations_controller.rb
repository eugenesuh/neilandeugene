# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
  #  devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :country, :phone_number, :gender, :birthdate]
  #end
  
  def update_status

    new_params = params.require(:user).permit(:status)
    @user = User.find(current_user.id)
    @user.update_without_password(new_params)
    
    resource.update_without_password(status)
  end
  
  
end