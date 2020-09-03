class Produto < ApplicationRecord
    validates_presence_of :nome, :preco, :quantidade, :foto

    has_one_attached :foto

    validates :foto, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
