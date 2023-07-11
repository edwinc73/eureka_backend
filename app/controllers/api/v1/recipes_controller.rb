class Api::V1::RecipesController < Api::V1::BaseController
  before_action :set_recipe, only: %i[show update create upload_img add_review]
  def index
    #params[:query] = "eg"
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @recipes = Recipe.where('LOWER(name) LIKE LOWER(?)', search_query)
      @ingredients = Ingredient.where('LOWER(name) LIKE LOWER(?)', search_query)
    else
      @recipes = Recipe.all
      render json: @recipes, serializer: RecipeSerializer
    end
  end

  def show
    render json: @recipe, serializer: RecipeSerializer
  end

  def create

  end

  def update

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

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :total_calories, :category, :fat, :protein, :carbs, :fiber, :sodium)
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def filter_recipes_by_calories(calorie_gap)
    if calorie_gap < 200
      suggested_recipes = Recipe.where(total_calories: 0..200)
    else
      suggested_recipes = Recipe.where("total_calories < ?", calorie_gap)
    end
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
end
