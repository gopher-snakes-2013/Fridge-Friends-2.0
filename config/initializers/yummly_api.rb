Yummly.configure do |config|
        config.use_ssl = false
        config.app_id = ENV['YUMMLY_APP_ID']
        config.app_key = ENV['YUMMLY_APP_KEY']
      end