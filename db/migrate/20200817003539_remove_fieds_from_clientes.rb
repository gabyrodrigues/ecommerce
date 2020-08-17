class RemoveFiedsFromClientes < ActiveRecord::Migration[6.0]
  def change
    remove_column :clientes, :cpf, :string
    remove_column :clientes, :endereco, :string
    remove_column :clientes, :bairro, :string
    remove_column :clientes, :cidade, :string
    remove_column :clientes, :estado, :string
  end
end
