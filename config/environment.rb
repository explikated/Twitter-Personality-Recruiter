# Load the rails application
require File.expand_path('../application', __FILE__)

config.action_mailer.delivery_method = :smtp

# Initialize the rails application
TwitterPersonalityRecruiter::Application.initialize!
