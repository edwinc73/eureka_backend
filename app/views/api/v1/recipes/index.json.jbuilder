json.recipes @recipes do |recipe|
  json.extract! recipe, :name, :description, :instructions, :total_calories, :category, :carbs, :fat, :protein, :fiber, :sodium
  json.created_at recipe.created_at.strftime('%Y/%m/%d')
  json.updated_at recipe.updated_at.strftime('%Y/%m/%d')
end

json.ingredients @ingredients do |ingredient|
  json.extract! ingredient, :name, :calories, :portion_size, :category, :carbs, :fats, :proteins, :fiber, :sodium
  json.created_at ingredient.created_at.strftime('%Y/%m/%d')
  json.updated_at ingredient.updated_at.strftime('%Y/%m/%d')
end
