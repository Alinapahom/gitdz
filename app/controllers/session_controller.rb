# frozen_string_literal: true

class SessionController < ApplicationController
  skip_before_action :authorize, only: %i[login create]

  def login
    redirect_to root_url if current_user
  end

  def create
    user = User.find_by(nick: params[:nick])

    # Проверка, получилась ли регистрация.
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:alert] = 'Неправильный логин или пароль!'
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil # Выход из аккаунта
    redirect_to login_url
  end
end
