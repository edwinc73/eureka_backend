class Api::V1::RecipesController < Api::V1::BaseController
  before_action :set_recipe, only: %i[show update create upload_img add_review add_to_goal]
  def index
    #params[:query] = "salad"
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @recipes = Recipe.where('LOWER(name) LIKE LOWER(?)', search_query)
    else
      @recipes = Recipe.all
    end
    render json: @recipes, each_serializer: RecipeSerializer
  end

  def show
    # specific seed whose preps don't match the seed data need to update
    if @recipe.seed_data? && @recipe.preps.present?
      update_data
    end
    render json: @recipe, serializer: RecipeSerializer, show: true
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.created_by_id = User.last.id # @current_user.id
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
    if params[:ingredients].present?
      create_preps(@recipe)
    end
  end

  def update
    # need authorization: only
  end

  def upload_img
    photo = params[:photos]
    @recipe.photos.attach(photo)
    @recipe.save!
    if @recipe.save
      render json: { message: 'Image uploaded successfully' }
    else
      render json: { error: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def suggestion
    #user = @current_user
    user = User.last
    # height_in_meters = user.height.to_f / 100
    # bmi = user.weight.to_f / (height_in_meters * height_in_meters)
    # p bmi
    goal = user.goals.last
    calorie_gap = goal.calorie_goal - goal.current_calorie
    @suggested_recipes = filter_recipes_by_calories(calorie_gap)
    render json: @suggested_recipes, each_serializer: RecipeSerializer
  end

  def add_review
    #user = @current_user
    user = User.last
    review = Review.new(review_params.merge(recipe: @recipe, user: user))
    if review.save
      render json: { message: "Review added successfully" }
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_to_goal
    #user = @current_user
    user = User.last
    goal = user.goals.last
    meal = Meal.new(meal_params.merge(goal: goal, recipe: @recipe))
    if meal.save
      render json: { message: "Meal added successfully" }
    else
      render json: { error: meal.errors.full_messages }, status: :unprocessable_entity
    end
    update_goal
  end

  def index_ingredients
    ingredients = Ingredient.all.group_by(&:category)
    render json: ingredients, each_serializer: IngredientSerializer
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:portion)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :total_calories, :category, :fat, :protein, :carbs, :fiber, :sodium, :portion)
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

  def update_data
    ingredient_calories = @recipe.preps.map do |ingredient|
      ingredient.portion * ingredient.ingredient.calories
    end
    ingredient_portion = @recipe.preps.map { |i| i.portion }
    fat = @recipe.preps.map { |i| i.portion * i.ingredient.fats }
    protein = @recipe.preps.map { |i| i.portion * i.ingredient.proteins }
    carbs = @recipe.preps.map { |i| i.portion * i.ingredient.carbs }
    fiber = @recipe.preps.map { |i| i.portion * i.ingredient.fiber }
    sodium = @recipe.preps.map { |i| i.portion * i.ingredient.sodium }
    @recipe.update(
      total_calories: ingredient_calories.sum.round,
      fat: fat.sum.round(1),
      protein: protein.sum.round(1),
      carbs: carbs.sum.round(1),
      fiber: fiber.sum.round(1),
      sodium: sodium.sum.round,
      portion: ingredient_portion.sum,
      seed_data: false
    )
    @recipe.save
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
    #goal = @current_user.goals.last
    goal = User.last.goals.last
    calorie_meals = goal.meals.map do |meal|
      meal.recipe.total_calories / meal.recipe.portion * meal.portion
    end
    fat_meals = goal.meals.map { |meal| meal.recipe.fat / meal.recipe.portion * meal.portion }
    protein_meals = goal.meals.map { |meal| meal.recipe.protein / meal.recipe.portion * meal.portion }
    carbs_meals = goal.meals.map { |meal| meal.recipe.carbs / meal.recipe.portion * meal.portion }
    goal.current_fat = fat_meals.sum.round(1)
    goal.current_protein = protein_meals.sum.round(1)
    goal.current_carbs = carbs_meals.sum.round(1)
    goal.current_calorie = calorie_meals.sum
    goal.save
  end

  def create_preps(recipe)
    ingredients = params[:ingredients]
    # ingredients = {
      # beef: { name: "beef", portion: 1 },
      # rice: { name: "rice", portion: 1 },
      # broccoli: { name: "Broccoli", portion: 1 }
    # }
    ingredients.values.each do |i|
      ingredient = Recipe.find_by(name: i[:name])
      portion = i[:portion]
      prep = Prep.new(
        portion: portion,
        ingredient: ingredient,
        recipe: recipe
      )
      if prep.save
        render json: prep, status: :created
      else
        render json: { errors: prep.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

end
