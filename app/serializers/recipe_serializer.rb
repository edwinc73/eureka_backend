class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructions, :total_calories, :category, :fat, :protein, :carbs, :fiber, :sodium, :photos
  has_many :ingredients
  has_many :reviews

  def photos
    object.photos.map { |photo| photo.url }
  end
end
