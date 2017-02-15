class Question < ApplicationRecord
 ##Relations
 belongs_to :user

  ##Validates
  validates :text, :user, presence: true

  ## Callbacks

  ##Etc.

end
