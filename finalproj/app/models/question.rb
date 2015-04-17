class Question < ActiveRecord::Base
  # Form validations
  validates :title, 
  			presence: true
  validates :content,
  			presence: true

  # A question may have many answers submitted by users
  # Destroy answers on question delete
  has_many 	:answers, 
  			dependent: :destroy

  # Tags belong to a question to denote content
  has_many  :tags,
        dependent: :destroy

  # Relationship used to destroy notifications when question destroyed
  has_many :notifications,
        dependent: :destroy

  # A question belongs to the user that posted it
  belongs_to :user
end
