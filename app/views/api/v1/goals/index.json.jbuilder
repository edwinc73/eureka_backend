json.goals @goals do |goal|
  json.extract! goal, :id, :calorie_goal, :current_calorie
  json.created_date goal.created_at.strftime('%d')
  json.create_day goal.created_at.strftime('%A')
  json.updated_at goal.updated_at.strftime('%Y/%m/%d')
  json.meals goal.meals do |meal|
    json.extract! meal, :name, :portion, :recipe
  end
end

json.weekly_goals @weekly_goals do |goal|
  json.extract! goal, :id, :calorie_goal, :current_calorie
  json.created_date goal.created_at.strftime('%d')
  json.create_day goal.created_at.strftime('%A')
  json.updated_at goal.updated_at.strftime('%Y/%m/%d')
  json.meals goal.meals do |meal|
    json.extract! meal, :name, :portion, :recipe
  end
end
