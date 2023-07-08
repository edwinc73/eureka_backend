class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories
      t.integer :portion_size
      t.string :category
      t.float :fats
      t.float :proteins
      t.float :carbs
      t.float :fiber
      t.integer :sodium

      t.timestamps
    end
  end
end
