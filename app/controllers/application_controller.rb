class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # метод-помощник, доступный во вьюхах
  helper_method :current_user, :background_color

  private

  # хелпер, достающий текущего юзера по данным аутентификации в сессии
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # редиректит юзера на главную с предупреждением
  def reject_user
    redirect_to root_path, alert: 'Вам сюда низя!'
  end

end
