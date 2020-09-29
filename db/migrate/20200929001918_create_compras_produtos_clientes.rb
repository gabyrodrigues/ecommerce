class CreateComprasProdutosClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :compras_produtos_clientes do |t|
      t.references :cliente, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
