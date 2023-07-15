class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :calorie_goal
      t.integer :current_calorie
      t.float :fat_goal
      t.float :protein_goal
      t.float :carbs_goal
      t.float :current_fat
      t.float :current_protein
      t.float :current_carbs

      t.timestamps
    end
  end
end
