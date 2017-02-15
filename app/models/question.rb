class Question < ApplicationRecord

  ##Relations
  belongs_to :user

  ##Validates
  validates :text, :user, presence: true
  validates_length_of :text, maximum: 255
  ## Callbacks

  ##Etc.

end
