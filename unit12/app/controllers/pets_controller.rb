class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # User auth and admin needed
  before_action :authenticate_user!
  before_action :require_admin

  # GET /pets
  def index
    @pets = Pet.get_available_pets
  end

  # GET /pets/1
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /pets/1
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully removed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Redirect to root if not admin
    def require_admin
      # Check if admin
      if user_signed_in? and !current_user.admin
        redirect_to shelter_index_url, alert: 'You do not have permission to edit pets.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :age, :description, :pet_type, :picture)
    end
end
