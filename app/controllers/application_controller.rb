class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,if: :devise_controller?

  protected

  def configure_permitted_parameters
  	  devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name,:experience,:username,:email,:password,:password_confirmation)}
      devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email,:password)}
      devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:first_name, :last_name,:experience,:username,:email,:password,:remember_me)}
  end
  #def is_user?
   # user_signed_in? && current_user.role.created_at == "role"
 # end
  #helper_method :is_user?
 # before_filter :set_current_user

  #def set_current_user
   # Participation.user = current_user
  #end
end


