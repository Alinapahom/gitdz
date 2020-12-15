# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new
    redirect_to root_url if current_user
  end

  def create
    user = User.create(user_params)
    return render :new unless user.valid?

    session[:user_id] = user.id
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:nick, :name, :surname, :email, :password, :password_confirmation)
  end
end
