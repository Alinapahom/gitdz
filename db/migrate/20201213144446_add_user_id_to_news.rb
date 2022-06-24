# frozen_string_literal: true

class AddUserIdToNews < ActiveRecord::Migration[6.0]
  def change
    remove_column :news, :user
    add_reference :news, :user, null: false, foreign_key: true
  end
end
