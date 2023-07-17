class GoalSerializer < ActiveModel::Serializer
  attributes :id, :calorie_goal, :current_calorie, :fat_goal, :protein_goal, :carbs_goal, :current_fat, :current_protein, :current_carbs, :created_date, :create_day
  has_many :meals

  def created_date
    object.created_at.strftime('%d')
  end

  def create_day
    object.created_at.strftime('%A')
  end

end
