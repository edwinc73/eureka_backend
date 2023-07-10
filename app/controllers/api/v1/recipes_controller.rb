class Api::V1::RecipesController < Api::V1::BaseController
  before_action :set_recipe, only: %i[show update]
  def index
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @recipes = Recipe.where('LOWER(name) LIKE LOWER(?)', search_query)
      @ingredients = Ingredient.where('LOWER(name) LIKE LOWER(?)', search_query)
    else
      @recipes = Recipe.all
    end
  end

  def show

  end

  def upload_img

  end

  def suggestion
    #user = @current_user
    user = User.last
    height_in_meters = user.height.to_f / 100
    bmi = user.weight.to_f / (height_in_meters * height_in_meters)
    p bmi
    @suggested_recipes = filter_recipes_by_bmi(bmi)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :total_calories, :category, :fat, :protein, :carbs, :fiber, :sodium)
  end

  def filter_recipes_by_bmi(bmi)
      if bmi > 24
        suggested_recipes = Recipe.where(total_calories: 0..300)
      elsif bmi < 24 && bmi > 19
        suggested_recipes = Recipe.all
      else
        suggested_recipes = Recipe.where("total_calories > ?", 300)
      end
    suggested_recipes
  end
end
