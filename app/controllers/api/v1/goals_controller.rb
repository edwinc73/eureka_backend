class Api::V1::GoalsController < Api::V1::BaseController
  before_action :set_goal, only: %i[update]
  before_action :update_current_goal, only: %i[show]
  def show
  end

  def index
    # @user = @current_user
    @user = User.last
    @goals = @user.goals.all
    @weekly_goals = @goals.last(7)
  end

  def update
    if @goal.update(goal_params)
      render json: { msg: 'your goal updated' }
    else
      render_error
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:calorie_goal, :fat_goal, :protein_goal, :carbs_goal)
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def update_current_goal
    #@goal = @current_user.goals.last
    @goal = User.last.goals.last
    calorie_meals = @goal.meals.map do |meal|
      meal.recipe.total_calories / meal.recipe.portion * meal.portion
    end
    fat_meals = @goal.meals.map { |meal| meal.recipe.fat / meal.recipe.portion * meal.portion }
    protein_meals = @goal.meals.map { |meal| meal.recipe.protein / meal.recipe.portion * meal.portion }
    carbs_meals = @goal.meals.map { |meal| meal.recipe.carbs / meal.recipe.portion * meal.portion }
    @goal.current_fat = fat_meals.sum.round(1)
    @goal.current_protein = protein_meals.sum.round(1)
    @goal.current_carbs = carbs_meals.sum.round(1)
    @goal.current_calorie = calorie_meals.sum
    @goal.save
  end

  def render_error
    render json: { errors: @goal.errors.full_messages },
    status: :unprocessable_entity
  end
end
