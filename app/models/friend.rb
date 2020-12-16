# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user, foreign_key: :id_user
  belongs_to :friend, class_name: :User, foreign_key: :id_friend

  class << self
    def make_fiends(current_user, second_user)
      create([
               { id_user: current_user.id, id_friend: second_user.id },
               { id_friend: current_user.id, id_user: second_user.id }
             ])
    end
  end
end
