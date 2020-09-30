class ChangeFieldsToCompras < ActiveRecord::Migration[6.0]
  def change
    remove_column :compras, :data_hora, :datetime
    add_column :compras, :data, :date
    add_column :compras, :hora, :time
  end
end
