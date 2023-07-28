class Api::V1::RecipesController < Api::V1::BaseController
  before_action :set_recipe, only: %i[show update upload_img add_review add_to_goal]
  def index
    # params[:query] = "salad"
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @recipes = Recipe.where('LOWER(name) LIKE LOWER(?)', search_query)
    else
      @recipes = Recipe.all
    end
    render json: @recipes, each_serializer: RecipeSerializer, scope: @current_user
  end

  def show
    # recipes which preps don't match the seed data need to update
    if @recipe.preps.present? && @recipe.seed_data?
      update_data(@recipe)
    end
    render json: @recipe, serializer: RecipeSerializer, show: true, scope: @current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.created_by_id = @current_user.id
    if params[:ingredients].present?
      create_preps(@recipe)
      update_data(@recipe)
      nutrition_expert = nutrition_expert(@recipe)
      plate_balancer = plate_balancer(@recipe)
    end
    if @recipe.save
      rt = recipe_trailblazer
      ec = eureka_chef
      render json: {
        message: 'Recipe create successfully',
        nutrition_expert_and_badge_master: nutrition_expert,
        plate_balancer_and_badge_master: plate_balancer,
        recipe_trailblazer_and_badge_master: rt,
        eureka_chef_and_badge_master: ec,
        recipe_id: @recipe.id
      }
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    # need authorization: only
    @recipe.update(recipe_params)
    if @recipe.save
      render json: { message: 'Recipe update successfully'}
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def upload_img
    photo = params[:photos]
    @recipe.photos.attach(photo)
    if @recipe.save
      render json: { message: 'Image uploaded successfully' }
    else
      render json: { error: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def suggestion
    user = @current_user
    # height_in_meters = user.height.to_f / 100
    # bmi = user.weight.to_f / (height_in_meters * height_in_meters)
    # p bmi
    goal = user.goals.last
    calorie_gap = goal.calorie_goal - goal.current_calorie
    @suggested_recipes = filter_recipes_by_calories(calorie_gap)
    render json: @suggested_recipes, each_serializer: RecipeSerializer, scope: @current_user
  end

  def add_review
    user = @current_user
    review = Review.new(review_params.merge(recipe: @recipe, user: user))
    if review.save
      render json: { message: "Review added successfully" }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_to_goal
    user = @current_user
    goal = user.goals.last
    meal = Meal.new(meal_params.merge(goal: goal, recipe: @recipe))
    if meal.save
      carbo_king = carbo_king(user, meal)
      update_goal
      render json: { message: "Meal added successfully", carbo_king: carbo_king }
    else
      render json: { error: meal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:portion)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :category)
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def filter_recipes_by_calories(calorie_gap)
    if calorie_gap < 250
      suggested_recipes = Recipe.where(total_calories: 0..250)
    else
      suggested_recipes = Recipe.where("total_calories < ?", calorie_gap)
    end
  end

  def update_data(recipe)
    ingredient_portion = recipe.preps.map { |i| i.portion }
    ingredient_calories = recipe.preps.map {|i| i.portion * i.ingredient.calories}
    fat = recipe.preps.map { |i| i.portion * i.ingredient.fats }
    protein = recipe.preps.map { |i| i.portion * i.ingredient.proteins }
    carbs = recipe.preps.map { |i| i.portion * i.ingredient.carbs }
    fiber = recipe.preps.map { |i| i.portion * i.ingredient.fiber }
    sodium = recipe.preps.map { |i| i.portion * i.ingredient.sodium }
    recipe.update(
      total_calories: ingredient_calories.sum.round,
      fat: fat.sum.round(1),
      protein: protein.sum.round(1),
      carbs: carbs.sum.round(1),
      fiber: fiber.sum.round(1),
      sodium: sodium.sum.round,
      portion: ingredient_portion.sum,
      seed_data: false
    )
    recipe.save
  end

  # def filter_recipes_by_bmi(bmi)
    # if bmi > 24
      # suggested_recipes = Recipe.where(total_calories: 0..300)
    # elsif bmi < 24 && bmi > 19
      # suggested_recipes = Recipe.all
    # else
      # suggested_recipes = Recipe.where("total_calories > ?", 300)
    # end
    # suggested_recipes
  # end

  def update_goal
    goal = @current_user.goals.last
    calorie_meals = goal.meals.map do |meal|
      meal.recipe.total_calories / meal.recipe.portion * meal.portion
    end
    fat_meals = goal.meals.map { |meal| meal.recipe.fat / meal.recipe.portion * meal.portion }
    protein_meals = goal.meals.map { |meal| meal.recipe.protein / meal.recipe.portion * meal.portion }
    carbs_meals = goal.meals.map { |meal| meal.recipe.carbs / meal.recipe.portion * meal.portion }
    goal.current_fat = fat_meals.sum.round(1)
    goal.current_protein = protein_meals.sum.round(1)
    goal.current_carbs = carbs_meals.sum.round(1)
    goal.current_calorie = calorie_meals.sum.round
    goal.save
  end

  def create_preps(recipe)
    ingredients = params[:ingredients]
    # ingredients = {
      # beef: { id: 1, portion: 1 },
      # rice: { id: 2, portion: 1 },
      # broccoli: { id: 3, portion: 1 }
    # }
    ingredients.values.each do |i|
      id = i["id"]
      ingredient = Ingredient.find(id)
      portion = i["portion"]
      prep = Prep.new(
        portion: portion,
        ingredient: ingredient,
        recipe: recipe
      )
      prep.save!
    end
  end

  def carbo_king(user, meal)
    if user.badges.count { |x| x.name == "Carbo King"} == 0
      if meal.recipe.carbs >= 150
        badge = Badge.find_by(name: "Carbo King")
        Achievement.create(user: user, badge: badge)
        achieve = badge_master(user)
        return achieve
      else
        return "0"
      end
    else
      return "0"
    end
  end

  def nutrition_expert(recipe)
    user = @current_user
    if user.badges.count { |x| x.name == "Nutrition Expert" } == 0
      nutrient_ratio(recipe)
      if (0.45..0.60).include?(nutrition[:carbs]) &&
        (0.25..0.45).include?(nutrition[:protein]) &&
        (0.15..0.25).include?(nutrition[:fat])&&
        (25..30).include?(nutrition[:fiber])
        badge = Badge.find_by(name: "Nutrition Expert")
        Achievement.create(user: user, badge: badge)
        achieve = badge_master(user)
        return achieve
      else
        return "0"
      end
    else
      return "0"
    end
  end

  def nutrient_ratio(recipe)
    protein = recipe.protein * 4 / recipe.total_calories
    fat = recipe.fat * 9 / recipe.total_calories
    carbs = recipe.carbs * 4 / recipe.total_calories
    fiber = recipe.fiber
    nutrition = {
      protein: protein,
      fat: fat,
      carbs: carbs,
      fiber: fiber
    }
  end

  def plate_balancer(recipe)
    user = @current_user
    if user.badges.count { |x| x.name == "Plate Balancer"} == 0
      if recipe.fat? && recipe.protein? && recipe.carbs? && recipe.fiber? && recipe.sodium?
        badge = Badge.find_by(name: "Plate Balancer")
        Achievement.create(user: user, badge: badge)
        achieve = badge_master(user)
        return achieve
      else
        return "0"
      end
    else
      return "0"
    end
  end

  def recipe_trailblazer
    user = @current_user
    if user.badges.count { |x| x.name == "Recipe Trailblazer" } == 0
      id = user.id
      if Recipe.all.count { |r| r.created_by_id == id } == 1
        badge = Badge.find_by(name: "Recipe Trailblazer")
        Achievement.create(user: user, badge: badge)
        achieve = badge_master(user)
        return achieve
      else
        return "0"
      end
    else
      "0"
    end
  end

  def eureka_chef
    user = @current_user
    if user.badges.count { |x| x.name == "Eureka Chef" } == 0
      id = user.id
      if Recipe.all.count { |r| r.created_by_id == id } == 5
        badge = Badge.find_by(name: "Eureka Chef")
        Achievement.create(user: user, badge: badge)
        achieve = badge_master(user)
        return achieve
      else
        return "0"
      end
    else
      return "0"
    end
  end

  def badge_master(user)
    if user.badges.count { |x| x.name == "Badge Master" } == 0
      if user.badges.count == 5
        badge = Badge.find_by(name: "Badge Master")
        Achievement.create(user: user, badge: badge)
        return "2"
      else
        return "1"
      end
    else
      return "1"
    end
  end

end
