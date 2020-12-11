class NewsController < ApplicationController
  before_action :authorize

  def posts
    # current_user.id
    arr = Friend.select(:id_friend).where(id_user: current_user.id )
    @res_posts=[] 
    News.select(:post, :user, :created_at).where("user = ? ",user_id.id.to_i).each do |elem|
      y = User.find(elem.user)
      @res_posts << [["#{y.name} #{y.surname}"],[elem.post],[elem.created_at],[user_id.id.to_i]]
    end
    
    arr.each do |x|
      News.select(:post, :user, :created_at).where("user = ? ",x.id_friend.to_i).each do |elem|
        y = User.find(elem.user)
        @res_posts << [["#{y.name} #{y.surname}"],[elem.post],[elem.created_at],[elem.user.to_i]]
      end
    end
    @res_posts.sort! { |a, b| b[2] <=> a[2] } # В данной функции выводим посты друзей и свои из БД
  end

  def post_add
    user_id = User.find(session[:user_id]) if session[:user_id]
    @text = params[:post]
    post = News.new
    post.post = @text #Заполняем новый пост текстом
    post.user = user_id.id # и id пользователя
    post.save
    respond_to do |format|
      format.html
      format.js { render inline: "location.reload();" }
    end
  end

  def post_get
      respond_to do |format|
        format.html
        format.json do
          render json: { text: News.last  #Отдает в JSON последнюю запись
          }
        end
      end

  end
end
