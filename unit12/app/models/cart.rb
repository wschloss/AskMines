class Cart < ActiveRecord::Base
  has_many :selected_pets, dependent: :destroy
end
