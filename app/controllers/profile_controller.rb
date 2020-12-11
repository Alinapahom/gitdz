class ProfileController < ApplicationController
  before_action :authorize  
  
  def me
    @id_user = params[:id_user]
    if @id_user == nil

    else
      begin
        @frineduser ||= User.find(@id_user) #Берем из базы инфу о текущем пользователе
      end
    end
  end
end
