class SessionsController < ApplicationController
  skip_before_action :authorize

  def login; end

  def go
    user = Player.find_by(email: session_params[:email])
    puts "--- #{user} ---"

    if user.present? && user.valid_password?(session_params[:password]) && user.encrypted_password.present?
    session[:user_id] = user.id
    redirect_to session[:previous_url] || root_path
    else
      redirect_to login_path, alert: t(:invalid_email_password)
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to login_path, notice: t(:logout_success)
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end