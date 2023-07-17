class PrepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :portion, :ingredient

  def ingredient
    object.ingredient
  end
end
