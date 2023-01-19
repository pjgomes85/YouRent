class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_paramters, if: :devise_controller?

  private

  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[full_name phone_number description avatar])
  end
end
