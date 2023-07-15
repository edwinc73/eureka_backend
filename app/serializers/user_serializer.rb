class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :age, :weight, :height, :gender, :goal_weight, :badges

  def badges
    object.achievements.map do |a|
      {
        name: a.badge.name ,
        image: a.badge.badge_img ,
        description: a.badge.description ,
        gain_badge_date: a.created_at.strftime('%Y/%m/%d')
      }
    end
  end

end
