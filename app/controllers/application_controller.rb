class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :nickname, :email, :password, :password_confirmation, :image_url) }
  end

   def track_action
    ahoy.track "Processed #{controller_name}##{action_name}", request.filtered_parameters
  end

end
