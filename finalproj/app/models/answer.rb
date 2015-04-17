class Answer < ActiveRecord::Base
  # Answer belongs to one question
  belongs_to :question
  # Answer belongs to user that posted it
  belongs_to :user

  # Form validations
  validates :content,
  			presence: true
end
