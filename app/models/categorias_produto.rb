class CategoriasProduto < ApplicationRecord
  belongs_to :categoria
  belongs_to :produto

  validates_presence_of :categoria, :produto
end
