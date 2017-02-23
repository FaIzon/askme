class UsersController < ApplicationController
  def index
    # который создает модель, не записывая её в базу
    @users = [
      User.new(
        id: 1,
        name: 'Ivan',
        username: 'ivanko',
        avatar_url: ''
      ),
      User.new(
        id: 2,
        name: 'Petr',
        username: 'petrenko'
      )
    ]
  end

  def new
  end

  def edit
  end

  def show
    # Болванка вопросов для пользователя
    @questions = [
      Question.new(text: 'Как погода?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'Отмечаем?', created_at: Date.parse('27.03.2016')),
    ]

    # Болванка пользователя
    @user = User.new(
      name: 'Ivan',
      username: 'ivanko',
      questions: @questions
    )

    # Болванка для нового вопроса
    @new_question = Question.new

  end
end
