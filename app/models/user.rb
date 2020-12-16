# frozen_string_literal: true

class User < ApplicationRecord
  has_many :friends, foreign_key: :id_friend, inverse_of: :friendships, dependent: :delete
  has_many :news, inverse_of: :news, dependent: :delete

  has_secure_password

  validates :name, presence: true
  validates :surname, presence: true
  validates :nick, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, email: true, uniqueness: true

  def full_name
    "#{name} #{surname}"
  end

  class << self
    def find_possible_friends_for(user, name)
      friend_ids = [user.id, *Friend.select(:id).where(id_user: user.id)]
      query = where.not(id: friend_ids)
      query.where(['name = :name or surname = :name', { name: name }]) if name || query
    end
  end
end
