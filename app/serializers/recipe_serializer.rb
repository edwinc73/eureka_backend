class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructions, :total_calories, :portion, :category, :nutritious, :photos, :rating, :created_at, :updated_at
  has_many :ingredients, if: -> { instance_options[:show] }
  has_many :reviews, if: -> { instance_options[:show] }

  def photos
    if object.photos.attached?
      object.photos.map { |photo| photo.url }
    else
      object.photo
    end
  end

  def rating
    if object.reviews.present?
      rating = object.reviews.map { |x| x.rating }
      average = ((rating.sum)/rating.size).round(1)
    else
      "No more reviews"
    end
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

  def total_calories
    if object.seed_data? && object.preps.present?
      ingredient_calories = object.preps.map do |ingredient|
        ingredient.portion * ingredient.ingredient.calories
      end
      ingredient_calories.sum.round
    else
      object.total_calories
    end
  end

  def nutritious
    if object.preps.empty? || object.seed_data == false
      {
        fat: object.fat,
        protein: object.protein,
        carbs: object.carbs,
        fiber: object.fiber,
        sodium: object.sodium
      }
    else
      fat = object.preps.map { |i| i.portion * i.ingredient.fats }
      protein = object.preps.map { |i| i.portion * i.ingredient.proteins }
      carbs = object.preps.map { |i| i.portion * i.ingredient.carbs }
      fiber = object.preps.map { |i| i.portion * i.ingredient.fiber }
      sodium = object.preps.map { |i| i.portion * i.ingredient.sodium }
      {
        fat: fat.sum,
        protein: protein.sum,
        carbs: carbs.sum,
        fiber: fiber.sum,
        sodium: sodium.sum.round
      }
    end
  end

  def portion
    if object.preps.empty?
      3
    else
      ingredient_portion = object.preps.map { |i| i.portion }
      ingredient_portion.sum
    end
  end

  def created_at
    object.created_at.strftime("%Y-%m-%d")
  end

  def updated_at
    object.updated_at.strftime("%Y-%m-%d")
  end
end
