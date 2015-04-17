class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable, :timeoutable and :omniauthable
  devise :registerable,
         :recoverable, :trackable, :validatable

  devise :database_authenticatable, :authentication_keys => [:username]

  validates :username,
  			presence: true,
  			uniqueness: true

  # User has many questions they have posted
  has_many :questions, dependent: :destroy
  # User has many answers they have poster
  has_many :answers, dependent: :destroy
end
