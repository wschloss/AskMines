require 'test_helper'

class SelectedPetsControllerTest < ActionController::TestCase
  setup do
    @selected_pet = selected_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selected_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selected_pet" do
    assert_difference('SelectedPet.count') do
      post :create, selected_pet: { cart_id: @selected_pet.cart_id, pet_id: @selected_pet.pet_id }, pet_id: pets(:one).id
    end

    assert_redirected_to shelter_index_url
  end

  test "should show selected_pet" do
    get :show, id: @selected_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selected_pet
    assert_response :success
  end

  test "should update selected_pet" do
    patch :update, id: @selected_pet, selected_pet: { cart_id: @selected_pet.cart_id, pet_id: @selected_pet.pet_id }
    assert_redirected_to selected_pet_path(assigns(:selected_pet))
  end

  test "should destroy selected_pet" do
    assert_difference('SelectedPet.count', -1) do
      delete :destroy, id: @selected_pet
    end

    assert_redirected_to shelter_index_url
  end
end
