class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # Set cart before destroy so all pets in cart can be set to available
  include CurrentCart
  before_action :set_cart, only: [:destroy]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # On sign out, also set all pets in car to available
  def destroy
    # Set all pets in cart to available
    @cart.selected_pets.each do |selected_pet|
      selected_pet.pet.set_status 'Available'
    end
    # Destroy cart, which removes all SelectedPet models in the db
    @cart.destroy if @cart.id == session[:cart_id]
    # Call devise default
    super
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
