class CreateCompras < ActiveRecord::Migration[6.0]
  def change
    create_table :compras do |t|
      t.references :cliente, null: false, foreign_key: true
      t.datetime :data_hora

      t.timestamps
    end
  end
end
