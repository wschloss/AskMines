class SelectedPet < ActiveRecord::Base
  belongs_to :pet
  belongs_to :cart

  after_save :make_pet_unavailable
  after_destroy :make_pet_available

  private
  def make_pet_unavailable
  	self.pet.set_status 'Selected'
  end
  def make_pet_available
    unless self.pet.pet_status == 'Adopted'
  	  self.pet.set_status 'Available'
    end
  end
end
