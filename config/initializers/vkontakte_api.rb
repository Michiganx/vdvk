VkontakteApi.configure do |config|
  # Authorization parameters (not needed when using an external authorization):
  config.app_id       = '5020822'
  config.app_secret   = '33JQffS1sjB7WcAJbzh5'
  config.redirect_uri = 'vdolgah.herokuapp.com/callback'

  
  # Faraday adapter to make requests with:
  # config.adapter = :net_http
  
  # HTTP verb for API methods (:get or :post)
  # config.http_verb = :get
  
  # Logging parameters:
  # log everything through the rails logger
  config.logger = Rails.logger
  
  # log requests' URLs
  # config.log_requests = true
  
  # log response JSON after errors
  # config.log_errors = true
  
  # log response JSON after successful responses
  # config.log_responses = false
end

# create a short alias VK for VkontakteApi module
# VkontakteApi.register_alias
