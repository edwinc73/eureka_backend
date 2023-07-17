class Api::V1::PrepsController < Api::V1::BaseController
  before_action :set_recipe, only: %i[index create destroy update]
  before_action :set_prep, only: %i[update destroy]

  def index
    @preps = @recipe.preps
    render json: @preps, each_serializer: PrepSerializer
  end

  def create
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
        recipe: @recipe
      )
      if prep.save
        render json: prep, status: :created
      else
        render json: { errors: prep.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @prep.destroy
      render json: { message: "Ingredient deleted" }
      @recipe.seed_data == true
      @recipe.save
    end

    def update
      @prep.update(prep_params)
      if @prep.save
        render json: @prep, status: :created
      else
        render json: { errors: @prep.errors.full_messages }, status: :unprocessable_entity
      end
      @recipe.seed_data == true
      @recipe.save
    end

  end

  private

  def set_recipe
    # for test
    # @recipe = Recipe.first
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_prep
    @prep = Prep.find(params[:id])
  end

  def prep_params
    params.require(:prep).permit(:portion)
  end

end
