class CheckBadgeJob < ApplicationJob
  queue_as :default

  def perform
    User.all.each do |user|
      check_starving(user)
      healthy_eater(user)
    end
    # User.all.each do |user|
      # healthy_eater(user)
    # end
  end

  private

  def check_starving(user)
    if user.badges.count { |x| x.name == "Starving" } == 0
      if user.goals.last.current_calorie == 0
        badge = Badge.find_by(name: "Starving")
        Achievement.create(user: user, badge: badge)
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
      end
    end
  end

end
