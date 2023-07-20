namespace :goals do
  desc "create goals for each user everyday"
  task create_all: :environment do
    User.all.each do |user|
      CreateGoalsJob.perform_now(user)
    end
  end
end
