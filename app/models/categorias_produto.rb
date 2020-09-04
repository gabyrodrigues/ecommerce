class CategoriasProduto < ApplicationRecord
  belongs_to :categoria
  belongs_to :produto

  validates_presence_of :categoria, :produto

#   after_save :salvar_categorias_produtos

#     def salvar_categorias_produtos

#     end
end
