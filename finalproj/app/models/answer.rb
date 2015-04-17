class Answer < ActiveRecord::Base
  # Answer belongs to one question
  belongs_to :question

  # Form validations
  validates :content,
  			presence: true
end
