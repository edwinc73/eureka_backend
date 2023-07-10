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

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :total_calories, :category, :fat, :protein, :carbs, :fiber, :sodium)
  end
end
