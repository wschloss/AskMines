class ShelterController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:index, :adopt, :finish]

  # User auth needed for cart
  before_action :authenticate_user!, only: [:adopt, :finish]

  # GET /shelter/index
  def index
  	@pets = Pet.get_available_pets
  end

  # GET /shelter/adopt
  def adopt
  	# Renders cart with all selected pets info and adopt/refuse button/link
  	@adopting = true
  end

  # POST /shelter/finish
  def finish
  	# Sets pets to adopted status, clears out cart
  	@cart.selected_pets.each do |selected_pet|
      selected_pet.pet.set_status 'Adopted'
    end

    @cart.destroy if @cart.id == session[:cart_id]
  	respond_to do |format|
      format.html { redirect_to shelter_index_url, notice: 'You have adopted your pets!' }
    end
  end

end
