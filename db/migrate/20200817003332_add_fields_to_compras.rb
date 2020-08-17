class AddFieldsToCompras < ActiveRecord::Migration[6.0]
  def change
    add_column :compras, :cep, :string
    add_column :compras, :endereco, :string
    add_column :compras, :bairro, :string
    add_column :compras, :cidade, :string
    add_column :compras, :estado, :string
    add_column :compras, :forma_pagamento, :string
    add_column :compras, :valor_total, :decimal
    add_column :compras, :numero_cartao, :string
    add_column :compras, :cvv, :integer
    add_column :compras, :data_validade, :string
    add_column :compras, :status, :string
  end
end
