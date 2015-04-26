class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable, :recoverable, :timeoutable and :omniauthable
  devise :registerable, :trackable, :validatable

  devise :database_authenticatable, :authentication_keys => [:username]

  validates :username,
  			presence: true,
  			uniqueness: true

  # User has many questions they have posted
  has_many :questions, dependent: :destroy
  # User has many answers they have posted
  has_many :answers, dependent: :destroy
  # User has notifications about their questions and answers
  has_many :notifications, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
end
