class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_paramters, if: :devise_controller?

  private

  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fullname phone_number description])
  end
end
