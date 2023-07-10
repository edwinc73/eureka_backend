json.extract! @goal, :calorie_goal, :fat_goal, :protein_goal, :carbs_goal, :current_calorie
json.created_at @goal.created_at.strftime('%Y/%m/%d')
json.updated_at @goal.updated_at.strftime('%Y/%m/%d')
json.extract! @current_nutrition, :current_fat, :current_protein, :current_carb
