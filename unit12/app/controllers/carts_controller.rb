class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /carts/1
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /carts/1
  def destroy
    # Set all pets to available
    @cart.selected_pets.each do |selected_pet|
      selected_pet.pet.set_status 'Available'
    end

    # Destroy if this cart is in the session
    @cart.destroy if @cart.id == session[:cart_id]
    respond_to do |format|
      format.html { redirect_to shelter_index_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end

    # Redirects user if attempts to modify url to an invalid cart path
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to shelter_index_url, notice: 'Invalid cart'
    end
end
