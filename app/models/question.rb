class Question < ApplicationRecord

  ##Relations
  belongs_to :user
  belongs_to :questioning_user, class_name: 'User', optional: true

  ##Validates
  validates :text, :user, presence: true
  validates_length_of :text, maximum: 255
  ## Callbacks

  ##Etc.

end
