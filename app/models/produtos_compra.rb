class ProdutosCompra < ApplicationRecord
  belongs_to :produto
  belongs_to :compra
end
