class CreateGoalsJob < ApplicationJob
  queue_as :default

  def perform
    User.all.offset(30).each do |user|
      bmr = calculate_bmr(user)
      user_target = user.goal_weight - user.weight
      goal = calculate_calorie_goal(bmr, user_target)
      Goal.create!(
        user: user,
        calorie_goal: goal[:calories],
        current_calorie: 0,
        fat_goal: goal[:fat],
        protein_goal: goal[:protein],
        carbs_goal: goal[:carbs],
        current_fat: 0,
        current_protein: 0,
        current_carbs: 0
      )
    end
  end

  private
  def calculate_bmr(user)
    bmr = 0
    if user.gender == 'm'
      bmr = 10 * user.weight + 6.25 * user.height - 5 * user.age + 5
    elsif user.gender == 'f'
      bmr = 10 * user.weight + 6.25 * user.height - 5 * user.age - 161
    end
    bmr.round
  end

  def calculate_calorie_goal(bmr, target)
    fat = (bmr * 0.3) / 9
    protein = (bmr * 0.2) / 4
    carbs = (bmr * 0.5) / 4
    calorie = bmr * 1.5
    if target <= 2 && target >= -2
      goal = {
        fat: fat.round(1),
        protein: protein.round(1),
        carbs: carbs.round(1),
        calories: calorie.round
      }
    elsif target > 2
      goal = {
        fat: (fat * 1.2).round(1),
        protein: (protein * 1.2).round(1),
        carbs: (carbs * 1.2).round(1),
        calories: (calorie * 1.2).round
      }
    else
      goal = {
        fat: (fat * 0.8).round(1),
        protein: (protein * 0.8).round(1),
        carbs: (carbs * 0.8).round(1),
        calories: (calorie * 0.8).round
      }
    end
    goal
  end

end
