require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'dont save user with nil field' do
    assert User.create(nick: nil, name: 'Alina', surname: 'Pakhomova', email: 'test@test.ru', password_digest: '1').invalid?
    assert User.create(nick: 'nick_name', name: nil, surname: 'Pakhomova', email: 'test@test.ru', password_digest: '1').invalid?
    assert User.create(nick: 'nick_name', name: 'Alina', surname: nil, email: 'test@test.ru', password_digest: '1').invalid?
    assert User.create(nick: 'nick_name', name: 'Alina', surname: 'Pakhomova', email: nil, password_digest: '1').invalid?
    assert User.create(nick: 'nick_name', name: 'Alina', surname: 'Pakhomova', email: 'test@test.ru', password_digest: nil).invalid?
    assert User.create(nick: nil, name: nil, surname: nil, email: nil, password_digest: nil).invalid?
  end
  test 'save user with  valid fields' do
    assert User.create(nick: 'nick', name: 'Alina', surname: 'Pakhomova', email: 'test', password_digest: '1').invalid?
    assert User.create(nick: 'nick', name: 'Alina', surname: 'Pakhomova', email: 'test@test.ru', password_digest: '1').valid?
  end
  test 'dont save user with same email' do
    assert User.create(nick: 'nick', name: 'Alina', surname: 'Pakhomova', email: 'test@test.ru', password_digest: '1').valid?
    assert User.create(nick: 'nick', name: 'Alina', surname: 'Pakhomova', email: 'test@test.ru', password_digest: '1').invalid?
    assert User.create(nick: 'nick', name: 'Alina', surname: 'Pakhomova', email: 'test1@test.ru', password_digest: '1').valid?
  end
end
