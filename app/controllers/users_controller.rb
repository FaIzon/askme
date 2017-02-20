class UsersController < ApplicationController
  def index
    # # который создает модель, не записывая её в базу
    # @users = [
    #   User.new(
    #     id: 1,
    #     name: 'Vadim',
    #     username: 'installero',
    #     avatar_url: ''
    #   ),
    #   User.new(
    #     id: 2,
    #     name: 'Misha',
    #     username: 'aristofun'
    #   )
    # ]
  end

  def new
  end

  def edit
  end

  def show
    # Болванка пользователя
    @user = User.new(
      name: 'Vadim',
      username: 'installero'
    )

    # Болванка вопросов для пользователя
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.03.2016')),
    ]

    # Болванка для нового вопроса
    @new_question = Question.new

  end
end
