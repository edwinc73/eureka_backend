class CheckBadgeJob < ApplicationJob
  queue_as :default

  def perform
    User.all.each do |user|
      check_starving(user)
      healthy_eater(user)
      meal_designer(user)
      goal_achiever(user)
      sugar_free_champion(user)
    end
  end

  private

  def check_starving(user)
    if user.badges.count { |x| x.name == "Starving" } == 0
      if user.goals.last.current_calorie == 0
        badge = Badge.find_by(name: "Starving")
        Achievement.create(user: user, badge: badge)
        badge_master(user)
      end
    end
  end

  def healthy_eater(user)
    if user.badges.count { |x| x.name == "Healthy Eater" } == 0
      goal = user.goals.last
      light_meals = goal.meals.count { |meal| meal.recipe.total_calories < 300 }
      protein_rich_meals = goal.meals.count { |meal| meal.recipe.protein >= 20 }
      fiber_rich_meals = goal.meals.count { |meal| meal.recipe.fiber >= 10 }
      high_sodium_meals = goal.meals.count { |meal| meal.recipe.sodium > 700 }
      if light_meals >= 2 &&
        protein_rich_meals >= 1 &&
        fiber_rich_meals >= 1 &&
        high_sodium_meals == 0
        badge = Badge.find_by(name: "Healthy Eater")
        Achievement.create(user: user, badge: badge)
        badge_master(user)
      end
    end
  end

  def meal_designer(user)
    if user.badges.count { |x| x.name == "Meal Designer" } == 0
      meals = user.goals.last(7).map { |goal| goal.meals.size }
      meals_number = meals.sum
      if meals_number > 19
        badge = Badge.find_by(name: "Meal Designer")
        Achievement.create(user: user, badge: badge)
        badge_master(user)
      end
    end
  end

  def goal_achiever(user)
    if user.badges.count { |x| x.name == "Goal Achiever" } == 0
      achieve_goals = user.goals.count { |goal| goal.current_calorie <= goal.calorie_goal }
      if achieve_goals == 10
        badge = Badge.find_by(name: "Goal Achiever")
        Achievement.create(user: user, badge: badge)
        badge_master(user)
      end
    end
  end

  def sugar_free_champion(user)
    if user.badges.count { |x| x.name == "Sugar-Free Champion" } == 0
      low_carbs_meals = user.goals.last(7).map do |goal|
        goal.meals.count { |meal| meal.recipe.carbs <= 15 }
      end
      if low_carbs_meals.sum > 10
        badge = Badge.find_by(name: "Sugar-Free Champion")
        Achievement.create(user: user, badge: badge)
        badge_master(user)
      end
    end
  end

  def badge_master(user)
    if user.badges.count { |x| x.name == "Badge Master" } == 0
      if user.badges.count == 5
        badge = Badge.find_by(name: "Badge Master")
        Achievement.create(user: user, badge: badge)
      end
    end
  end

end
