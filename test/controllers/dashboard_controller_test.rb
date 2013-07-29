require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get turno" do
    get :turno
    assert_response :success
  end

  test "should get code" do
    get :code
    assert_response :success
  end

  test "should get frases" do
    get :frases
    assert_response :success
  end

  test "should get icinga" do
    get :icinga
    assert_response :success
  end

  test "should get servicios" do
    get :servicios
    assert_response :success
  end

  test "should get twitter" do
    get :twitter
    assert_response :success
  end

end
