class Produto < ApplicationRecord
    validates_presence_of :nome, :preco, :quantidade, :foto

    has_one_attached :foto
end
