# frozen_string_literal: true

class News < ApplicationRecord
  validates :post, presence: true
end
