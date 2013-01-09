require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get lpa" do
    get :lpa
    assert_response :success
  end

  test "should get lds" do
    get :lds
    assert_response :success
  end

  test "should get sda" do
    get :sda
    assert_response :success
  end

  test "should get ninja" do
    get :ninja
    assert_response :success
  end

  test "should get tasks" do
    get :tasks
    assert_response :success
  end

end
