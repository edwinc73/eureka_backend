class Api::V1::MealsController < Api::V1::BaseController
  before_action :set_meal, only: %i[show destroy]
  def index
    current_goal = @current_user.goals.last
    @meals = current_goal.meals
    render json: @meals, each_serializer: MealSerializer
  end

  def show
    render json: @meal, serializer: MealSerializer
  end

  def destroy
    @meal.destroy
    render json: { message: "Meal removed from today's goal" }
    update_goal
  end

  private

  def update_goal
    goal = @current_user.goals.last
    calorie_meals = goal.meals.map do |meal|
      meal.recipe.total_calories / meal.recipe.portion * meal.portion
    end
    fat_meals = goal.meals.map { |meal| meal.recipe.fat / meal.recipe.portion * meal.portion }
    protein_meals = goal.meals.map { |meal| meal.recipe.protein / meal.recipe.portion * meal.portion }
    carbs_meals = goal.meals.map { |meal| meal.recipe.carbs / meal.recipe.portion * meal.portion }
    goal.current_fat = fat_meals.sum.round(1)
    goal.current_protein = protein_meals.sum.round(1)
    goal.current_carbs = carbs_meals.sum.round(1)
    goal.current_calorie = calorie_meals.sum
    goal.save
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end
end
