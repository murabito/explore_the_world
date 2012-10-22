require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "should have a new action" do
  	guide = guides(:croatia)
    get :new, :guide_id => guide.id
    assert guide == assigns(:guide)
    assert_response :success
  end

  test "should create place" do
  	guide = guides(:croatia)
    assert_difference('Place.count') do
      post :create, :guide_id => guide.id, :place => { :name => 'Test Place' }
    end
    assert guide == assigns(:guide)
    assert_redirected_to guide_place_path(guide, assigns(:place))
    assert_equal 'Place was successfully created.', flash[:notice]
  end


end
