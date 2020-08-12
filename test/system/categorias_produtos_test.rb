require "application_system_test_case"

class CategoriasProdutosTest < ApplicationSystemTestCase
  setup do
    @categorias_produto = categorias_produtos(:one)
  end

  test "visiting the index" do
    visit categorias_produtos_url
    assert_selector "h1", text: "Categorias Produtos"
  end

  test "creating a Categorias produto" do
    visit categorias_produtos_url
    click_on "New Categorias Produto"

    fill_in "Categoria", with: @categorias_produto.categoria_id
    fill_in "Produto", with: @categorias_produto.produto_id
    click_on "Create Categorias produto"

    assert_text "Categorias produto was successfully created"
    click_on "Back"
  end

  test "updating a Categorias produto" do
    visit categorias_produtos_url
    click_on "Edit", match: :first

    fill_in "Categoria", with: @categorias_produto.categoria_id
    fill_in "Produto", with: @categorias_produto.produto_id
    click_on "Update Categorias produto"

    assert_text "Categorias produto was successfully updated"
    click_on "Back"
  end

  test "destroying a Categorias produto" do
    visit categorias_produtos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categorias produto was successfully destroyed"
  end
end
