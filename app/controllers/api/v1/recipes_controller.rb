class Api::V1::RecipesController < Api::V1::BaseController
  def index
    @recipes = Recipe.all
  end

  def upload_img

  end
end
