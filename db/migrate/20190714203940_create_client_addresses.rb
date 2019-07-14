class CreateClientAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :client_addresses do |t|
      t.references :client, foreign_key: true, null: false
      t.references :address, foreign_key: true, null: false
      t.index([:client_id, :address_id], unique: true, name: 'unique_client_and_address')

      t.timestamps
    end
  end
end
