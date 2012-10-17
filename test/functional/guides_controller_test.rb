require 'test_helper'

class GuidesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert assigns(:guides)
  end

  test "should create guide" do
    assert_difference('Guide.count') do
      post :create, :guide => { :name => 'Test Guide' }
    end
    assert_redirected_to guide_path(assigns(:guide))
    assert_equal 'Guide was successfully created.', flash[:notice]
  end

  test "#show should assign guide for existing guide" do
    get :show, :id => guides(:croatia)
    assert assigns(:guide)
  end

  test "#show should not assign guide for non-existant guide" do
    get :show, :id => 0
    assert_nil assigns(:guide)
    assert_select 'h2', 'This guide does not exist.' 
  end

  test "should view list of guides" do
    get :show, :id => guides(:croatia)
    # css_select 'title', "Explore the World"
    # css_select 'h2', "Guides"
    # assert_select guide_path(assigns(:guide))
  end
end
