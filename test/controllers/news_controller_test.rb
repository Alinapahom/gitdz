# frozen_string_literal: true

require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  test 'should add posts' do
    post '/users',
         params: { user: { nick: 'alpahom', name: 'Alina', surname: 'Pakhomova', email: 'alpahom030102@gmail.com',
                           password: '030102', password_confirmation: '030102' } }
    follow_redirect!
    assert_response :success
    post '/post_add', params: { post: 'Текст поста' }
    assert News.find_by(post: 'Текст поста')
  end
end
