class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #защита запроса от подделки(Вызывает исключение ActionController :: InvalidAuthenticityToken)
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user # Если пользователь не зарегестрирван, то отправлять на станицу регистрации
  end
end
