require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

test "should get new" do
  post '/users', params: {user: {nick: 'alpahom', name: 'Alina', surname: 'Pakhomova', email: 'alpahom030102@gmail.com',  password: '030102',  password_confirmation: '030102'}}
  assert_response :redirect
  follow_redirect!
  assert !session[:user_id].nil?
end

end
