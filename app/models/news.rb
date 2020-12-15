# frozen_string_literal: true

class News < ApplicationRecord
  belongs_to :user

  validates :post, presence: true
end
