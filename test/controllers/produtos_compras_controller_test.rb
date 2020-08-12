require 'test_helper'

class ProdutosComprasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @produtos_compra = produtos_compras(:one)
  end

  test "should get index" do
    get produtos_compras_url
    assert_response :success
  end

  test "should get new" do
    get new_produtos_compra_url
    assert_response :success
  end

  test "should create produtos_compra" do
    assert_difference('ProdutosCompra.count') do
      post produtos_compras_url, params: { produtos_compra: { compra_id: @produtos_compra.compra_id, produto_id: @produtos_compra.produto_id, quantidade: @produtos_compra.quantidade } }
    end

    assert_redirected_to produtos_compra_url(ProdutosCompra.last)
  end

  test "should show produtos_compra" do
    get produtos_compra_url(@produtos_compra)
    assert_response :success
  end

  test "should get edit" do
    get edit_produtos_compra_url(@produtos_compra)
    assert_response :success
  end

  test "should update produtos_compra" do
    patch produtos_compra_url(@produtos_compra), params: { produtos_compra: { compra_id: @produtos_compra.compra_id, produto_id: @produtos_compra.produto_id, quantidade: @produtos_compra.quantidade } }
    assert_redirected_to produtos_compra_url(@produtos_compra)
  end

  test "should destroy produtos_compra" do
    assert_difference('ProdutosCompra.count', -1) do
      delete produtos_compra_url(@produtos_compra)
    end

    assert_redirected_to produtos_compras_url
  end
end
