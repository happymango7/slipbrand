class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def after_sign_in_path_for(resource_or_scope)
		campaigns_path
	end

	def twitter_client
		Twitter::REST::Client.new do |config|
			config.consumer_key        = "KeYVWVyR5DAKdN6Jk9Yl65RI0"
			config.consumer_secret     = "qm3amdDuwrpQd1BxjiuufPN30rkywaSUhNOn04RO3s7P5XZPPE"
			config.access_token        = "154926467-pBxT4DVn2oEXvCpkBcoBNLRgnfOomvvVxYyFsfXD"
			config.access_token_secret =  "udkNyfdMj3gRaUZ6fFdidrspQokiX4Ur7fC3CQZRYrWiN"
		end
	end
end
