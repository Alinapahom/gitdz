# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user, foreign_key: :id_user
  belongs_to :firend, class_name: :User, foreign_key: :id_friend

  class << self
    def make_fiends(first_user, second_user)
      create([{ id_friend: first_user.id, id_user: second_user.id },
              { id_friend: second_user.id, id_user: first_user.id }])
    end
  end
end
