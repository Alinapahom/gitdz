# frozen_string_literal: true

class News < ApplicationRecord
  belongs_to :user

  validates :post, presence: true

  class << self
    def feed_for(user)
      news_author_ids = [*Friend.select(:id_friend).where(id_user: user.id).map(&:id_friend), user.id]
      News
        .joins(:user)
        .where(user: news_author_ids)
        .order(:created_at)
        .map { |news| [[news.user.full_name], [news.post], [news.created_at], [news.user.id]] }
    end
  end
end
