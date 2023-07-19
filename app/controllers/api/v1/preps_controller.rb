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
      ingredient = Recipe.find(id: i["id"])
      portion = i[:portion]
      prep = Prep.new(
        portion: portion,
        ingredient: ingredient,
        recipe: @recipe
      )
      if prep.save
        update_data(@recipe)
        @recipe.save
        render json: { message: "Ingredient added successfully" }
      else
        render json: { errors: prep.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @prep.destroy
      render json: { message: "Ingredient deleted" }
      update_data(@recipe)
      @recipe.save
    end

    def update
      @prep.update(prep_params)
      if @prep.save
        render json: {message: "Ingredient udated" }
      else
        render json: { errors: @prep.errors.full_messages }, status: :unprocessable_entity
      end
      update_data(@recipe)
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

  def update_data(recipe)
    ingredient_portion = recipe.preps.map { |i| i.portion }
    ingredient_calories = recipe.preps.map {|i| i.portion * i.ingredient.calories}
    fat = recipe.preps.map { |i| i.portion * i.ingredient.fats }
    protein = recipe.preps.map { |i| i.portion * i.ingredient.proteins }
    carbs = recipe.preps.map { |i| i.portion * i.ingredient.carbs }
    fiber = recipe.preps.map { |i| i.portion * i.ingredient.fiber }
    sodium = recipe.preps.map { |i| i.portion * i.ingredient.sodium }
    recipe.update(
      total_calories: ingredient_calories.sum.round,
      fat: fat.sum.round(1),
      protein: protein.sum.round(1),
      carbs: carbs.sum.round(1),
      fiber: fiber.sum.round(1),
      sodium: sodium.sum.round,
      portion: ingredient_portion.sum,
      seed_data: false
    )
    recipe.save
  end

end
