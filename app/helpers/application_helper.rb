module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'cookie.jpg'
    end
  end

  def declension_of_word(number, array_words, with_number = true)
    number = 0 if (number == nil || !number.is_a?(Numeric))

    prefix = ""
    prefix = "#{number.to_s} " if with_number

    remainder = number % 10
    remainder100 = number % 100

    if (remainder100 >= 11 && remainder100 <= 14)
      return "#{prefix}#{array_words[2]}"
    end

    if remainder == 1
      return "#{prefix}#{array_words[0]}"
    elsif remainder >= 2 && remainder <= 4
      return "#{prefix}#{array_words[1]}"
    else
      return "#{prefix}#{array_words[2]}"
    end
  end
end
