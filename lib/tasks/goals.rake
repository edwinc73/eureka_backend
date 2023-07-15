namespace :goals do
  desc "create goals for each user everyday"
  task create_for_users: :environment do
    User.all.each do |user|
      bmr = calculate_bmr(user)
    end


  end
end
