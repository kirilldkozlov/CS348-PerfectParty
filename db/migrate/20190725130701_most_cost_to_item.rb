class MostCostToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :supplier_items, :cost
    add_column :items, :cost, :decimal, precision: 10, scale: 2
  end
end
