class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :age, :weight, :height, :gender, :bmi, :goal_weight, :badges, :dishes

  def image
    if object.avatar.attached?
      object.avatar.url
    else
      object.image
    end
  end

  def bmi
    if object.height.present?
      height_in_meters = object.height.to_f / 100
      bmi = object.weight.to_f / (height_in_meters * height_in_meters)
      bmi.round(1)
    else
      nil
    end
  end

  def badges
    if object.achievements.present?
      object.achievements.map do |a|
        {
          id: a.badge.id,
          name: a.badge.name,
          image: a.badge.badge_img,
          description: a.badge.description,
          gain_badge_date: a.created_at.strftime('%Y/%m/%d')
        }
      end
    else
      nil
    end
  end

  def dishes
    Recipe.where(created_by_id: object.id)
  end

end
