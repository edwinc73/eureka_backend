json.goals @goals do |goal|
  json.extract! goal, :id, :calorie_goal, :current_calorie
  json.created_at goal.created_at.strftime('%Y/%m/%d')
  json.updated_at goal.updated_at.strftime('%Y/%m/%d')
end

json.weekly_goals @weekly_goals do |goal|
  json.extract! goal, :id, :calorie_goal, :current_calorie
  json.created_at goal.created_at.strftime('%Y/%m/%d')
  json.updated_at goal.updated_at.strftime('%Y/%m/%d')
end
