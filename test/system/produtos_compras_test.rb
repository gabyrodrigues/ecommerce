require "application_system_test_case"

class ProdutosComprasTest < ApplicationSystemTestCase
  setup do
    @produtos_compra = produtos_compras(:one)
  end

  test "visiting the index" do
    visit produtos_compras_url
    assert_selector "h1", text: "Produtos Compras"
  end

  test "creating a Produtos compra" do
    visit produtos_compras_url
    click_on "New Produtos Compra"

    fill_in "Compra", with: @produtos_compra.compra_id
    fill_in "Produto", with: @produtos_compra.produto_id
    fill_in "Quantidade", with: @produtos_compra.quantidade
    click_on "Create Produtos compra"

    assert_text "Produtos compra was successfully created"
    click_on "Back"
  end

  test "updating a Produtos compra" do
    visit produtos_compras_url
    click_on "Edit", match: :first

    fill_in "Compra", with: @produtos_compra.compra_id
    fill_in "Produto", with: @produtos_compra.produto_id
    fill_in "Quantidade", with: @produtos_compra.quantidade
    click_on "Update Produtos compra"

    assert_text "Produtos compra was successfully updated"
    click_on "Back"
  end

  test "destroying a Produtos compra" do
    visit produtos_compras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Produtos compra was successfully destroyed"
  end
end
