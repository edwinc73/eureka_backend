json.favorite_recipes @favorite_recipes do |recipe|
  json.extract! recipe, :id, :name, :description, :instructions, :total_calories, :category, :carbs, :fat, :protein, :fiber, :sodium
  json.created_at recipe.created_at.strftime('%Y/%m/%d')
  json.updated_at recipe.updated_at.strftime('%Y/%m/%d')
end
