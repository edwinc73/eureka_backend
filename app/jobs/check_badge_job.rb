class CheckBadgeJob < ApplicationJob
  queue_as :default

  def perform
    User.all.each do |user|
      check_starving(user)
    end
  end

  private

  def check_starving(user)
    user.badges.count { |x| x.id == 1 } == 0

  end
end
