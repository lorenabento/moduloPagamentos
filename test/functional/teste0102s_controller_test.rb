require 'test_helper'

class Teste0102sControllerTest < ActionController::TestCase
  setup do
    @teste0102 = teste0102s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teste0102s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teste0102" do
    assert_difference('Teste0102.count') do
      post :create, teste0102: { body: @teste0102.body, title: @teste0102.title }
    end

    assert_redirected_to teste0102_path(assigns(:teste0102))
  end

  test "should show teste0102" do
    get :show, id: @teste0102
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teste0102
    assert_response :success
  end

  test "should update teste0102" do
    put :update, id: @teste0102, teste0102: { body: @teste0102.body, title: @teste0102.title }
    assert_redirected_to teste0102_path(assigns(:teste0102))
  end

  test "should destroy teste0102" do
    assert_difference('Teste0102.count', -1) do
      delete :destroy, id: @teste0102
    end

    assert_redirected_to teste0102s_path
  end
end
