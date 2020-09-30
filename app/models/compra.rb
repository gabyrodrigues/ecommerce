class Compra < ApplicationRecord
    belongs_to :cliente
    has_many :produtos_compras

    validates_presence_of :cliente, :data, :hora, :cep, :endereco, :bairro, :cidade, :estado, :forma_pagamento, :valor_total, :status
end
