class ProdutosCompra < ApplicationRecord
    belongs_to :produto
    belongs_to :compra

    validates_presence_of :produto, :compra, :quantidade
end
