class Tag < ActiveRecord::Base
  # A tag is added to a question to note content
  belongs_to :question

  # Allowed tag categories
  TAG_OPTIONS = ['food', 'fun', 'classes', 'housing', 'other']
end
