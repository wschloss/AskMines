class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :category
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
