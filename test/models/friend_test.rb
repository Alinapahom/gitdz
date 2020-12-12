# frozen_string_literal: true

require 'test_helper'

class FriendTest < ActiveSupport::TestCase
  test 'Add friend to DB' do
    (Friend.find_by id_user: '1')&.destroy
    Friend.create id_user: '1', id_friend: '2'
    assert_not_nil Friend.find_by id_user: '1'
    (Friend.find_by id_user: '2')&.destroy
    Friend.create id_user: '2', id_friend: '1'
    # проверка существования в таблице друзей
    assert_equal Friend.where(id_friend: '1').first_or_create.id_user,
                 Friend.where(id_user: '1').first_or_create.id_friend
  end
end
