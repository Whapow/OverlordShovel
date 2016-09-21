class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize
  protect_from_forgery with: :null_session

  helper_method :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email])
	  end

    def authorize
      unless current_user
        session[:previous_url] = request.fullpath unless request.fullpath =~ /\/login/
        redirect_to login_path, notice: t(:please_log_in)
      end
    end

    def current_user
      if session[:user_id]
        @current_user ||= Player.find(session[:user_id])
      end
    end
end