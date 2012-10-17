require "test_helper"
require "capybara/rails"

# DatabaseCleaner.strategy = :truncation

module ActionController
	class IntegrationTest
		include Capybara::DSL
	end
end


# class ActionDispatch::IntegrationTest
#   include Capybara::DSL

#   self.use_transactional_fixtures = false

#   teardown do
#     DatabaseCleaner.clean
#     Capybara.reset_sessions!
#     Capybara.use_default_driver
#   end  
# end

