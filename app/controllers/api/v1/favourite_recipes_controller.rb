class Api::V1::FavouriteRecipesController < Api::V1::BaseController
  def index
    user = @current_user
    @favorite_recipes = user.recipes
    render json: @favorite_recipes, each_serializer: RecipeSerializer, scope: @current_user
  end

  def create
    recipe = Recipe.find(params[:id])
    user = @current_user
    user.recipes << recipe
    render json: { message: "Recipe added to favorites" }
  end

  def cancel
    recipe = Recipe.find(params[:id])
    user = @current_user
    user.recipes.delete(recipe)
    render json: { message: "Recipe removed from favorites" }
  end
end
