# frozen_string_literal: true

class FrinendsController < ApplicationController
  skip_before_action :verify_authenticity_token # отключаем защиту от подделки запросов на контроллере

  def view
    @res = current_user.friends
  end

  def add
    respond_to do |format|
      format.html
      format.json do
        # Выдаем JSON для AJAX запроса.
        render json: { man: User.find_possible_friends_for(current_user, params[:name]) }
      end
    end
  end

  def add_friend
    friend = User.find_by id: params[:add_friend].to_i
    return unless friend

    Friend.make_fiends(current_user, friend)
    redirect_to '/view_friends'
  end
end
