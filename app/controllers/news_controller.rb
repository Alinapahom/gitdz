# frozen_string_literal: true

class NewsController < ApplicationController
  def posts
    @res_posts = News.feed_for(current_user)
  end

  def post_add
    News.create(post: params[:post], user: current_user)
    respond_to do |format|
      format.html
      format.js { render inline: 'location.reload();' }
    end
  end

  def post_get
    respond_to do |format|
      format.html
      format.json do
        render json: { text: News.last }  # Отдает в JSON последнюю запись
      end
    end
  end
end
