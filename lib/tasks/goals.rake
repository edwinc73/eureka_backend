namespace :goals do
  desc "create goals for each user everyday"
  task create_for_users: :environment do
    User.all.each do |user|
      bmr = calculate_bmr(user)
      user_target = user.goal_weight - user.weight
      calorie_goal = calculate_calorie_goal(bmr, user_target)

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
    if target <= 2 && target >= -2
      goal = {
        fat: fat,
        protein: protein,
        cars: carbs,
        calories: bmr
      }
    elsif target > 2
      goal = {
        fat: fat * 1.2,
        protein: protein * 1.2,
        cars: carbs * 1.2,
        calories: bmr * 1.2
      }
    else
      goal = {
        fat: fat * 0.8,
        protein: protein * 0.8,
        cars: carbs * 0.8,
        calories: bmr * 0.8
      }
    end
    goal
  end
end
