class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructions, :total_calories, :portion, :category, :nutritious, :photos, :rating, :created_at, :updated_at, :created_by, :user_favourite, :is_made_by_current_user, :calories_per_100g, :nutritious_per_100g
  has_many :ingredients, if: -> { instance_options[:show] }
  has_many :reviews, if: -> { instance_options[:show] }

  def photos
    if object.photos.attached?
      object.photos.url
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
    object.reviews.order(created_at: :desc).map do |review|
      if review.user.avatar.attached?
        {
          user: review.username,
          user_img: review.user.avatar.url,
          rating: review.rating,
          content: review.content,
          created_at: review.created_at.strftime("%Y-%m-%d"),
          updated_at: review.created_at.strftime("%Y-%m-%d")
        }
      else
        {
          user: review.username,
          user_img: review.user.image,
          rating: review.rating,
          content: review.content,
          created_at: review.created_at.strftime("%Y-%m-%d"),
          updated_at: review.created_at.strftime("%Y-%m-%d")
        }
      end
    end
  end

  def calories_per_100g
    if object.total_calories.present?
      calories = (object.total_calories / object.portion).round
    else
      "null"
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
        fat: fat.sum.round(1),
        protein: protein.sum.round(1),
        carbs: carbs.sum.round(1),
        fiber: fiber.sum.round(1),
        sodium: sodium.sum.round
      }
    end
  end

  def nutritious_per_100g
    if object.portion == nil
      "null"
    elsif object.preps.empty? || object.seed_data == false
      {
        fat: (object.fat / object.portion).round(1),
        protein: (object.protein / object.portion).round(1),
        carbs: (object.carbs / object.portion).round(1),
        fiber: (object.fiber / object.portion).round(1),
        sodium: (object.sodium / object.portion).round
      }
    else
      fat = object.preps.map { |i| i.portion * i.ingredient.fats }
      protein = object.preps.map { |i| i.portion * i.ingredient.proteins }
      carbs = object.preps.map { |i| i.portion * i.ingredient.carbs }
      fiber = object.preps.map { |i| i.portion * i.ingredient.fiber }
      sodium = object.preps.map { |i| i.portion * i.ingredient.sodium }
      {
        fat: (fat.sum / object.portion).round(1),
        protein: (protein.sum / object.portion).round(1),
        carbs: (carbs.sum / object.portion).round(1),
        fiber: (fiber.sum / object.portion).round(1),
        sodium: (sodium.sum / object.portion).round
      }
    end
  end

  def portion
    if object.seed_data? && object.preps.present?
      ingredient_portion = object.preps.map { |i| i.portion }
      ingredient_portion.sum
    else
      object.portion
    end
  end

  def created_at
    object.created_at.strftime("%Y-%m-%d")
  end

  def updated_at
    object.updated_at.strftime("%Y-%m-%d")
  end

  def created_by
    id = object.created_by_id
    if id.present?
      User.find(id).username
    else
      "admin"
    end
  end

  def user_favourite
    user = scope
    user.recipes.count { |x| x.id == object.id } == 1
  end

  def is_made_by_current_user
    user = scope
    current_user_id = user.id
    object.created_by_id == current_user_id
  end
end
