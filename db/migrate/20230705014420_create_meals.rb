class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.float :portion
      t.string :name

      t.timestamps
    end
  end
end
