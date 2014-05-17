# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Todo::Application.initialize!

Todo::Application.config.session_store = :cookie_store