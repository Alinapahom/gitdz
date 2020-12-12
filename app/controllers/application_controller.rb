# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # защита запроса от подделки(Вызывает исключение ActionController::InvalidAuthenticityToken).
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    # Если пользователь не зарегистрирован, то отправлять на стhаницу регистрации&
    redirect_to '/login' unless current_user
  end
end
