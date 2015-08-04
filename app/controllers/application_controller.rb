class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    # сначала создадим клиент API
    vk = VkontakteApi::Client.new(session[:token])

    # теперь получим текущего юзера
    @user = vk.users.get(uid: session[:vk_id], fields: [:screen_name, :photo]).first

    # его друзей
    @friends = vk.friends.get(fields: [:screen_name, :sex, :photo, :last_seen])
    # отдельно выберем тех, кто в данный момент онлайн
    @friends_online = @friends.select { |friend| friend.online == 1 }

    # группы
    @groups = vk.groups.get(extended: 1)
    # первый элемент массива - кол-во групп; его нужно выкинуть
    @groups.shift

    # и ленту новостей
    raw_feed = vk.newsfeed.get(filters: 'post')
    # обработанную в отдельном методе
    @newsfeed = process_feed(raw_feed)
  end
end
