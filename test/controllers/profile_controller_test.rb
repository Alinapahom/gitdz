require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest

test "should get me" do
  get profile_me_url
  assert_response 302
  follow_redirect!
  post '/users', params: {user: { nick: 'alpahom', name: 'Alina', surname: 'Pakhomova', email: 'alpahom030102@gmail.com',  password: '030102',  password_confirmation: '030102'}}
  assert_response :redirect
  follow_redirect!
  assert_select 'body > div.page > div > div.column.right > div > div > ol > li:nth-child(2)', 'Имя: Alina'
  assert_select 'body > div.page > div > div.column.right > div > div > ol > li:nth-child(3)', 'Фамилия: Pakhomova'
  assert_select 'body > div.page > div > div.column.right > div > div > ol > li:nth-child(4)', 'Никнейм: alpahom'
  assert_select 'body > div.page > div > div.column.right > div > div > ol > li:nth-child(5)', 'Почта: alpahom030102@gmail.com'
end

end
