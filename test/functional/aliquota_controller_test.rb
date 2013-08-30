require 'test_helper'

class AliquotaControllerTest < ActionController::TestCase
  setup do
    @aliquotum = aliquota(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aliquota)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aliquotum" do
    assert_difference('Aliquotum.count') do
      post :create, aliquotum: { ano_base: @aliquotum.ano_base, ativa: @aliquotum.ativa, empregado_perc: @aliquotum.empregado_perc, empregador_perc: @aliquotum.empregador_perc, user_at: @aliquotum.user_at }
    end

    assert_redirected_to aliquotum_path(assigns(:aliquotum))
  end

  test "should show aliquotum" do
    get :show, id: @aliquotum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aliquotum
    assert_response :success
  end

  test "should update aliquotum" do
    put :update, id: @aliquotum, aliquotum: { ano_base: @aliquotum.ano_base, ativa: @aliquotum.ativa, empregado_perc: @aliquotum.empregado_perc, empregador_perc: @aliquotum.empregador_perc, user_at: @aliquotum.user_at }
    assert_redirected_to aliquotum_path(assigns(:aliquotum))
  end

  test "should destroy aliquotum" do
    assert_difference('Aliquotum.count', -1) do
      delete :destroy, id: @aliquotum
    end

    assert_redirected_to aliquota_path
  end
end
