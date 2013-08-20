require 'test_helper'

class ExemplosControllerTest < ActionController::TestCase
  setup do
    @exemplo = exemplos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exemplos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exemplo" do
    assert_difference('Exemplo.count') do
      post :create, exemplo: { ativo: @exemplo.ativo, cidade: @exemplo.cidade, datacadastro: @exemplo.datacadastro, idade: @exemplo.idade, logradouro: @exemplo.logradouro, nome: @exemplo.nome, telefone: @exemplo.telefone, uf: @exemplo.uf }
    end

    assert_redirected_to exemplo_path(assigns(:exemplo))
  end

  test "should show exemplo" do
    get :show, id: @exemplo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exemplo
    assert_response :success
  end

  test "should update exemplo" do
    put :update, id: @exemplo, exemplo: { ativo: @exemplo.ativo, cidade: @exemplo.cidade, datacadastro: @exemplo.datacadastro, idade: @exemplo.idade, logradouro: @exemplo.logradouro, nome: @exemplo.nome, telefone: @exemplo.telefone, uf: @exemplo.uf }
    assert_redirected_to exemplo_path(assigns(:exemplo))
  end

  test "should destroy exemplo" do
    assert_difference('Exemplo.count', -1) do
      delete :destroy, id: @exemplo
    end

    assert_redirected_to exemplos_path
  end
end
