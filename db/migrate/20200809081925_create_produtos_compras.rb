class CreateProdutosCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos_compras do |t|
      t.references :produto, null: false, foreign_key: true
      t.references :compra, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
