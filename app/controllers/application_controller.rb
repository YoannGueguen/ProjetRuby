class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  I18n.locale= :fr
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:email, :first_name, :last_name,:password, :password_confirmation])
  end
end
