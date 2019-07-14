class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :street_num, null: false
      t.string :street_name, null: false
      t.string :postal_code
      t.string :city
      t.string :province

      t.timestamps
    end
  end
end
