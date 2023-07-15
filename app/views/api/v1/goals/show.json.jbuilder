json.extract! @goal, :id, :calorie_goal, :fat_goal, :protein_goal, :carbs_goal, :current_calorie, :current_fat, :current_protein, :current_carbs
json.created_at @goal.created_at.strftime('%Y/%m/%d')
json.updated_at @goal.updated_at.strftime('%Y/%m/%d')
json.meals @goal.meals do |meal|
  json.extract! meal, :name, :portion, :recipe
end
