class Api::V1::RecipesController < Api::V1::BaseController
  def index
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @recipes = Recipe.where('LOWER(name) LIKE LOWER(?)', search_query)
      @ingredients = Ingredient.where('LOWER(name) LIKE LOWER(?)', search_query)
    else
      @recipes = Recipe.all
    end

  end

  def upload_img

  end
end
