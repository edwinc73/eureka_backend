class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipe

  def recipe
    object.recipe
  end
end
