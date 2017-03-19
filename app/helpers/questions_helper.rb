module QuestionsHelper
  def link_to_user_profile
    link_to current_user.username, user_path(current_user)
  end
end
