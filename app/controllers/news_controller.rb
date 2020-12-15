# frozen_string_literal: true

class NewsController < ApplicationController
  def posts
    user_ids = [*Friend.select(:id_friend).where(id_user: current_user.id), current_user]
    @res_posts = News
                 .joins(:user)
                 .where(user: user_ids)
                 .order(:created_at)
                 .map { |news| [[news.user.full_name], [news.post], [news.created_at], [news.user.id]] }
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
