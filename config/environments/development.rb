GCMServerTest::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  Paperclip.options[:command_path] = "/usr/local/bin/"



=begin
  Bullet.enable: enable Bullet gem, otherwise do nothing
  Bullet.alert: pop up a JavaScript alert in the browser
  Bullet.bullet_logger: log to the Bullet log file (Rails.root/log/bullet.log)
  Bullet.rails_logger: add warnings directly to the Rails log
  Bullet.airbrake: add notifications to airbrake
  Bullet.console: log warnings to your browser's console.log (Safari/Webkit browsers or Firefox w/Firebug installed)
  Bullet.growl: pop up Growl warnings if your system has Growl installed. Requires a little bit of configuration
  Bullet.xmpp: send XMPP/Jabber notifications to the receiver indicated. Note that the code will currently not handle
    the adding of contacts, so you will need to make both accounts indicated know each other manually before you will
    receive any notifications. If you restart the development server frequently, the 'coming online' sound for the
    bullet account may start to annoy - in this case set :show_online_status to false; you will still get notifications,
    but the bullet account won't announce it's online status anymore.

  Bullet also allows you to disable n_plus_one_query, unused_eager_loading and counter_cache detectors respectively
  Bullet.n_plus_one_query_enable = false
  Bullet.unused_eager_loading_enable = false
  Bullet.counter_cache_enable = false

  Whitelist
  Sometimes bullet may notify n plus one query, unused eager loading or counter cache you don't care about or
  they occur in the third party gems that you can't fix, you can add whitelist to bullet

  Bullet.add_whitelist :type => :n_plus_one_query, :class_name => "Post", :association => :comments
  Bullet.add_whitelist :type => :unused_eager_loading, :class_name => "Post", :association => :comments
  Bullet.add_whitelist :type => :counter_cache, :class_name => "Country", :association => :cities

  Important
  If you find bullet does not work for you, please disable your browser's cache.
=end

  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
  end

  # emberjs
  config.ember.variant = :development
end
