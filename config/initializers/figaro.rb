if Rails.env.production? 
  Figaro.require_keys(
    'REDIS_URL',
    'ACCOUNT_TOKEN',
    # 'GOOGLE_APP_ID',
    # 'GOOGLE_APP_KEY',
    # 'S3_BUCKET_NAME',
    # 'AWS_ACCESS_KEY_ID',
    # 'AWS_SECRET_ACCESS_KEY',
    # 'AWS_REGION'
  )
  Figaro.require_keys(
    'REDIS_URL',
    'ACCOUNT_TOKEN',
    # 'GOOGLE_APP_ID',
    # 'GOOGLE_APP_KEY',
    # 'S3_BUCKET_NAME',
    # 'AWS_ACCESS_KEY_ID',
    # 'AWS_SECRET_ACCESS_KEY',
    # 'AWS_REGION'
  )
end
