require 'test_helper'

class EwosControllerTest < ActionController::TestCase
  setup do
    @ewo = ewos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ewos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ewo" do
    assert_difference('Ewo.count') do
      post :create, ewo: {  }
    end

    assert_redirected_to ewo_path(assigns(:ewo))
  end

  test "should show ewo" do
    get :show, id: @ewo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ewo
    assert_response :success
  end

  test "should update ewo" do
    patch :update, id: @ewo, ewo: {  }
    assert_redirected_to ewo_path(assigns(:ewo))
  end

  test "should destroy ewo" do
    assert_difference('Ewo.count', -1) do
      delete :destroy, id: @ewo
    end

    assert_redirected_to ewos_path
  end
end
