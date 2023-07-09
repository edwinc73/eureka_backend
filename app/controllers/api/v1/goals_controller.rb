class Api::V1::GoalsController < Api::V1::BaseController
  before_action :set_goal, only: %i[show update]
  def show
    calorie_meals = @goal.meals.map {|meal| meal.recipe.total_calories}
    @goal.current_calorie = calorie_meals.sum
    @goal.save #update before show in case add more meals after goal_update
    fat_meals = @goal.meals.map {|meal| meal.recipe.fat}
    protein_meals = @goal.meals.map {|meal| meal.recipe.protein}
    carbs_meals = @goal.meals.map {|meal| meal.recipe.carbs}
    @current_nutrition = {
      current_fat: fat_meals.sum,
      current_protein: protein_meals.sum,
      current_carb: carbs_meals.sum
    }
  end

  def index
    @goals = Goal.includes(:meals).all
  end

  def create

  end

  private

  def goal_params
    params.require(:goal).permit(:calorie_goal, :fat_goal, :protein_goal, :carbs_goal)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def render_error
    render json: { errors: @goal.errors.full_messages },
    status: :unprocessable_entity
  end
end