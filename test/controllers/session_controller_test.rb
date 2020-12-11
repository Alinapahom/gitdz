require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest

test "should get login" do
  post '/users', params: {user: {nick: 'alpahom', name: 'Alina', surname: 'Pakhomova', email: 'alpahom030102@gmail.com',  password: '030102',  password_confirmation: '030102'}}
  assert_response :redirect
  follow_redirect!
  assert !session[:user_id].nil?
  get '/logout'
  assert_redirected_to '/login'
  post '/login', params: { nick: 'alpahom', password: '030102' }
  assert !session[:user_id].nil?

end
test 'dont have user' do
  post '/login', params: { email: 'alpahom030102@gmail.com', password: '123' }
  assert session[:user_id].nil?
end
end
