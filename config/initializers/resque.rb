$redis = ENV['REDIS_URL']
Resque.redis = $redis