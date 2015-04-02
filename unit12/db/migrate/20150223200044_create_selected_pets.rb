class CreateSelectedPets < ActiveRecord::Migration
  def change
    create_table :selected_pets do |t|
      t.references :pet, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
