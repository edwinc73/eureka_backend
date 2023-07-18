class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :portion_size, :category, :calories, :proteins, :fats, :carbs, :fiber, :sodium
end
