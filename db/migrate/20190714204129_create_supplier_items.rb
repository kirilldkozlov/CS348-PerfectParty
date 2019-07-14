class CreateSupplierItems < ActiveRecord::Migration[5.2]
  def change
    create_table :supplier_items do |t|
      t.references :supplier, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :quantity
      t.decimal :cost, precision:10, scale: 2

      t.timestamps
    end
  end
end
