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

  has_many  :tags,
        dependent: :destroy

  # A question belongs to the user that posted it
  belongs_to :user
end
