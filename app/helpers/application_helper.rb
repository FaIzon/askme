module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'cookie.jpg'
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def background_color
    @background_color = @user.background_color if @user.present?
  end

  def count_questions
    I18n.t('question', count: @questions.count)
  end

  def sklonenie(number, krokodil, krokodila, krokodilov)
    ostatok_10 = number % 10
    ostatok_100 = number % 100

    return krokodilov if (11..14).include?(ostatok_100)

    case ostatok_10
      when 1
        krokodil
      when (2..4)
        krokodila
      else
        krokodilov
    end
  end
end
