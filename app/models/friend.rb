# frozen_string_literal: true

class Friend < ApplicationRecord
  def sql_add_friend(id_friend_, id_user_)
    # Добавляем в базу друзей.
    Friend.create([{ id_friend: id_friend_, id_user: id_user_ }, { id_friend: id_user_, id_user: id_friend_ }])
  end
end
