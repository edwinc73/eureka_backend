class IngredientSerializer < ActiveModel::Serializer
  attributes :name, :calories, :portion_size, :category, :carbs, :fats, :proteins, :fiber, :sodium
end
