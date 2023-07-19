class Api::V1::IngredientsController < Api::V1::BaseController
  def index
    params[:query] = "eg"
    if params[:query].present?
      search_query = "%#{params[:query]}%"
      @ingredients = Ingredient.where('LOWER(name) LIKE LOWER(?) OR LOWER(category) LIKE LOWER(?)', search_query, search_query)
    else
      @ingredients = Ingredient.all
    end
    render json: @ingredients, each_serializer: IngredientSerializer
  end
end
