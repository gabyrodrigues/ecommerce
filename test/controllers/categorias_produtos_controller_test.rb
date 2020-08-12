require 'test_helper'

class CategoriasProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categorias_produto = categorias_produtos(:one)
  end

  test "should get index" do
    get categorias_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_categorias_produto_url
    assert_response :success
  end

  test "should create categorias_produto" do
    assert_difference('CategoriasProduto.count') do
      post categorias_produtos_url, params: { categorias_produto: { categoria_id: @categorias_produto.categoria_id, produto_id: @categorias_produto.produto_id } }
    end

    assert_redirected_to categorias_produto_url(CategoriasProduto.last)
  end

  test "should show categorias_produto" do
    get categorias_produto_url(@categorias_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_categorias_produto_url(@categorias_produto)
    assert_response :success
  end

  test "should update categorias_produto" do
    patch categorias_produto_url(@categorias_produto), params: { categorias_produto: { categoria_id: @categorias_produto.categoria_id, produto_id: @categorias_produto.produto_id } }
    assert_redirected_to categorias_produto_url(@categorias_produto)
  end

  test "should destroy categorias_produto" do
    assert_difference('CategoriasProduto.count', -1) do
      delete categorias_produto_url(@categorias_produto)
    end

    assert_redirected_to categorias_produtos_url
  end
end
