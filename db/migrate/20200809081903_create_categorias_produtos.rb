class CreateCategoriasProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :categorias_produtos do |t|
      t.references :categoria, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
