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

  test "should display error message for non-existing place" do
    guide = guides(:croatia)
    get :show, :guide_id => guide.id, :id => "not-here"
    #assert_nil assigns(:guide)
    assert_equal 'The place you were looking for could not be found.', flash[:alert]
  end
end
