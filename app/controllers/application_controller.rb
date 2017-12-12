class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def sign_in(user)
    session[:session_token] = SecureRandom.urlsafe_base64
    user.update!(session_token: session[:session_token])
  end

  def sign_out
    return unless current_user
    current_user.update!(session_token: nil)
    session.delete(:session_token)
  end

  def current_user
    @current_user ||= find_current_user
  end

  def find_current_user
    session_token = session[:session_token]
    session_token && User.find_by(session_token: session_token)
  end

  def ensure_signed_in
    return if current_user
    flash[:error] = 'you must be signed in to see this'
    redirect_to :root
  end

  def ensure_signed_out
    return unless current_user
    flash[:error] = 'you are already signed in'
    redirect_to users_path
  end
end
