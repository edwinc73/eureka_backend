# require 'sidekiq/cron'
#
# schedule_file = "config/sidekiq_schedule.yml"
#
# if File.exist?(schedule_file)
  # Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# end
#

require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../../config/sidekiq_schedule.yml', __dir__))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end
