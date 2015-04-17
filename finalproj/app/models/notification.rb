class Notification < ActiveRecord::Base
  # A notification tells a user about upvote/answers on the question it belongs to
  belongs_to :user
  belongs_to :question
end
