# frozen_string_literal: true

require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  test 'Add to DB' do
    (News.find_by user: '1')&.destroy
    News.create user: '1', post: 'Это пост для проверки'
    assert_not_nil News.find_by user: '1'
    assert_equal 'Это пост для проверки', News.where(user: '1').first_or_create.post
  end

  test 'dont save with nil post' do
    assert News.create(user: '2', post: nil).invalid?
  end
end
