class Compra < ApplicationRecord
    belongs_to :cliente

    validates_presence_of :cliente, :data_hora, :cep, :endereco, :bairro, :cidade, :estado, :forma_pagamento, :valor_total, :status
end
