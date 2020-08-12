class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :cpf
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end
