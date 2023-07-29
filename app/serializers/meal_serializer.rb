class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :portion, :meal_nutritious, :recipe, :recipe_img, :recipe_nutritious_per_100g
  belongs_to :goal

  def recipe_img
    if object.recipe.photos.attached?
      object.recipe.photos.url
    else
      object.recipe.photo
    end
  end

  def meal_nutritious
    recipe = object.recipe
    {
      meal_calories: (recipe.total_calories * object.portion / recipe.portion).round,
      meal_fat: (recipe.fat * object.portion / recipe.portion).round(1),
      meal_protein: (recipe.protein * object.portion / recipe.portion).round(1),
      meal_carbs: (recipe.carbs * object.portion / recipe.portion).round(1),
      meal_fiber: (recipe.fiber * object.portion / recipe.portion).round(1),
      meal_sodium: (recipe.sodium * object.portion / recipe.portion).round
    }
  end

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
