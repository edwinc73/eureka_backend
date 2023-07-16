class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.integer :total_calories
      t.string :category
      t.float :fat
      t.float :protein
      t.float :carbs
      t.float :fiber
      t.integer :sodium
      t.float :portion
      t.string :photo
      t.boolean :seed_data
      t.references :created_by, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
