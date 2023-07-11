class Api::V1::FavouriteRecipesController < ApplicationController
  def index
    # user = @current_user.id
    user = User.last
    @favorite_recipes = user.recipes
  end

  def create
    recipe = Recipe.find(params[:id])
    # user = @current_user.id
    user = User.last
    user.recipes << recipe
    render json: { message: "Recipe added to favorites" }
  end

  def destroy
    recipe = Recipe.find(params[:id])
    # user = @current_user.id
    user = User.last
    user.recipes.delete(recipe)
    render json: { message: "Recipe removed from favorites" }
  end
end
