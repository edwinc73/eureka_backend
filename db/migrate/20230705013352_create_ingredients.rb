class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :name
      t.integer :calories
      t.integer :portion_size
      t.string :category
      t.integer :fats
      t.integer :proteins
      t.integer :carbs
      t.integer :fibre
      t.integer :sodium

      t.timestamps
    end
  end
end
