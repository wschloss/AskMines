class SelectedPetsController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:create]

  before_action :set_selected_pet, only: [:show, :edit, :update, :destroy]

  # GET /selected_pets
  def index
    @selected_pets = SelectedPet.all
  end

  # GET /selected_pets/1
  def show
  end

  # GET /selected_pets/new
  def new
    @selected_pet = SelectedPet.new
  end

  # GET /selected_pets/1/edit
  def edit
  end

  # POST /selected_pets
  def create
    pet = Pet.find(params[:pet_id])

    @pets = Pet.get_available_pets
    
    @selected_pet = @cart.selected_pets.build(pet: pet)

    respond_to do |format|
      if @selected_pet.save
        format.html { redirect_to shelter_index_url }
        format.js {}
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /selected_pets/1
  def update
    respond_to do |format|
      if @selected_pet.update(selected_pet_params)
        format.html { redirect_to @selected_pet, notice: 'Selected pet was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /selected_pets/1
  def destroy
    @selected_pet.destroy
    respond_to do |format|
      format.html { redirect_to shelter_index_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_pet
      @selected_pet = SelectedPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selected_pet_params
      params.require(:selected_pet).permit(:pet_id)
    end
end
