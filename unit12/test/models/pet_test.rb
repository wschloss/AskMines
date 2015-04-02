require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # Tests invalid if no name given
  test "no name" do
  	pet = Pet.new(name: pets(:noName).name, age: pets(:noName).age, description: pets(:noName).description)
  	assert pet.invalid?
  	assert pet.errors[:name].any?
  end

  # Tests a pet with no values
  test "empty" do
  	pet = Pet.new(name: pets(:empty).name, age: pets(:empty).age, description: pets(:empty).description)
  	assert pet.invalid?
  	assert pet.errors[:name].any?
  	assert pet.errors[:description].any?
  end

  # Tests a description length of 9 is invalid
  test "length nine" do
    pet = Pet.new(name: pets(:lengthNine).name, age: pets(:lengthNine).age, description: pets(:lengthNine).description)
    assert pet.invalid?
    assert pet.errors[:description].any?
  end

  # Tests a description length of 10 is valid
  test "length ten" do
    pet = Pet.new(name: pets(:lengthTen).name, age: pets(:lengthTen).age, description: pets(:lengthTen).description)
    assert pet.valid?
    assert_not pet.errors[:description].any?
  end

  # Tests a description length of 40 is valid
  test "length fourty" do
    pet = Pet.new(name: pets(:lengthFourty).name, age: pets(:lengthFourty).age, description: pets(:lengthFourty).description)
    assert pet.valid?
    assert_not pet.errors[:description].any?
  end

  # Tests a description length of 41 is invalid
  test "length fourty one" do
    pet = Pet.new(name: pets(:lengthFourtyOne).name, age: pets(:lengthFourtyOne).age, description: pets(:lengthFourtyOne).description)
    assert pet.invalid?
    assert pet.errors[:description].any?
  end
end
