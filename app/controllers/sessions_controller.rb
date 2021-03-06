class SessionsController < ApplicationController

  def new
  end

  # создает в объекте session новый факт залогиненности пользователя
  # если он правильно сообщил мэйл/пароль
  def create
    user = User.authenticate(params[:email], params[:password])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Вы успешно залогинились'
    else
      flash.now.alert = 'Неправильный мэйл или пароль'
      render :new
    end
  end

  # удаляет сессию залогиненного юзера
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Вы разлогинились! Приходите еще!'
  end

end