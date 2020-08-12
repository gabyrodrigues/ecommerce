class CategoriasProduto < ApplicationRecord
  belongs_to :categoria
  belongs_to :produto
end
