# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Защита запроса от подделки (Вызывает исключение ActionController::InvalidAuthenticityToken).
  protect_from_forgery with: :exception

  before_action :authorize

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorize
    # Если пользователь не зарегистрирован, то отправлять на страницу регистрации.
    redirect_to login_url unless current_user
  end
end
