class Produto < ApplicationRecord
    validates_presence_of :nome, :preco, :quantidade
end
