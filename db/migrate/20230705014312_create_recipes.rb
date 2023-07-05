class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :instructions
      t.integer :total_calories
      t.integer :total_nutrients
      t.string :category

      t.timestamps
    end
  end
end
