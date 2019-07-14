class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :telephone
      t.integer :events_supplied

      t.timestamps
    end
  end
end
