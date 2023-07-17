class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :portion, :recipe, :recipe_nutritious_per_100g
  belongs_to :goal

  def recipe_nutritious_per_100g
    recipe = object.recipe
    {
      calories: (recipe.total_calories / recipe.portion).round,
      fat: (recipe.fat / recipe.portion).round(1),
      protein: (recipe.protein / recipe.portion).round(1),
      carbs: (recipe.carbs / recipe.portion).round(1),
      fiber: (recipe.fiber / recipe.portion).round(1),
      sodium: (recipe.sodium / recipe.portion).round
    }
  end

end
