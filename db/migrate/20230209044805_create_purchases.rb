class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :comprador
      t.string :descripción_del_item
      t.decimal :precio_del_item
      t.integer :total_de_items
      t.string :direccion_de_vendedor
      t.string :vendedor

      t.timestamps
    end
  end
end
