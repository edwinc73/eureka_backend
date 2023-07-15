namespace :goals do
  desc "create goals for each user everyday"
  task create_for_users: :environment do
    User.all.each do |user|
      bmr = calculate_bmr(user)
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
  end
end
