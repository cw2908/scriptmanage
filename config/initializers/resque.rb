$redis = ENV['REDIS_URL']
Resque.redis = $redis
Resque.redis.namespace = Rails.application.class.parent_name
if Rails.env == 'development'
  Resque.logger.level = Logger::DEBUG
end