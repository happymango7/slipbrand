require 'twitter'

$twitter = Twitter::REST::Client.new do |config|
	config.consumer_key        = "KeYVWVyR5DAKdN6Jk9Yl65RI0"
	config.consumer_secret     = "qm3amdDuwrpQd1BxjiuufPN30rkywaSUhNOn04RO3s7P5XZPPE"
	config.access_token        = "154926467-pBxT4DVn2oEXvCpkBcoBNLRgnfOomvvVxYyFsfXD"
	config.access_token_secret =  "udkNyfdMj3gRaUZ6fFdidrspQokiX4Ur7fC3CQZRYrWiN"
end