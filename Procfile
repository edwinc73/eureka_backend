rake: bundle exec rake
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q default -q mailers -C config/sidekiq_schedule.yml
