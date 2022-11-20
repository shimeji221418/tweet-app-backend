FirebaseIdToken.configure do |config|
    config.redis = Redis.new
    config.project_ids = ['tweet-app-7856d']
  end