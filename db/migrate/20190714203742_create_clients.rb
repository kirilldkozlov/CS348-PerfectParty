class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :telephone
      t.string :email, unique: true

      t.timestamps
    end
  end
end
