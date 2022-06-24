# frozen_string_literal: true

class ProfileController < ApplicationController
  def me
    @user = User.find_by(id: params[:id_user]) || current_user
  end
end
