class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    return nil unless session[:session_token]

    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to(cats_url)
  end

  def logged_in?
    !!current_user
  end

  def require_signed_out
    redirect_to cats_url if logged_in?
  end

end
