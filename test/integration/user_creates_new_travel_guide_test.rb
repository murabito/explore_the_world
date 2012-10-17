require 'integration_test_helper'

class UserCreatesNewTravelGuideTest < ActionDispatch::IntegrationTest
  # fixtures :all

  test "user creates guide with 2 places" do
  	visit root_path
  	click_link "New Guide"
  	assert current_path == new_guide_path
  	
  	fill_in :name, with:"Argentina"
  	fill_in :description, with:"2013 trip"
  	click_button "Create Guide"
  	assert current_path == guide_path(Guide.last)
  end
end
