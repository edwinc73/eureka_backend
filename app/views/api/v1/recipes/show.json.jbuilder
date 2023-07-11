json.extract! @recipe, :id, :name, :description, :instructions, :total_calories, :category, :fat, :protein, :carbs, :fiber, :sodium

json.photos @recipe.photos do |photo|
  json.photo_url photo.key
end

json.ingredients @recipe.preps do |ingredient|
  json.portion ingredient.portion
  json.ingredient ingredient.ingredient.name
end

json.reviews @recipe.reviews do |review|
  json.extract! review, :username, :rating, :content
  json.created_at review.created_at.strftime('%Y/%m/%d')
end
