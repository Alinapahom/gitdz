# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authorize

  def me
    @id_user = params[:id_user]
    # Берем из базы инфу о текущем пользователе.
    @frineduser ||= User.find(@id_user) unless @id_user.nil?
  end
end
