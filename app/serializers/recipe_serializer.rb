class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructions, :total_calories, :category, :fat, :protein, :carbs, :fiber, :sodium, :photos, :rating, :created_at, :updated_at
  has_many :ingredients, if: -> { instance_options[:show_reviews] }
  has_many :reviews, if: -> { instance_options[:show_reviews] }

  def photos
    object.photos.map { |photo| photo.url }
  end

  def rating
    rating = object.reviews.map { |x| x.rating }
    average = ((rating.sum)/rating.size).round(1)
  end

  def reviews
    object.reviews.map do |review|
      {
        user: review.username,
        rating: review.rating,
        content: review.content,
        created_at: review.created_at.strftime("%Y-%m-%d"),
        updated_at: review.created_at.strftime("%Y-%m-%d")
      }
    end
  end

  def ingredients
    object.preps.map do |ingredient|
      {
        name: ingredient.ingredient.name,
        portion: ingredient.portion
      }
    end
  end

  def created_at
    object.created_at.strftime("%Y-%m-%d")
  end

  def updated_at
    object.updated_at.strftime("%Y-%m-%d")
  end
end
