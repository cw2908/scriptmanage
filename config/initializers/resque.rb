$redis = ENV['REDIS_URL']
Resque.redis = $redis
if Rails.env == 'development'
  Resque.logger.level = Logger::DEBUG
end