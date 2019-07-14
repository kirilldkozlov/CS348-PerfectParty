class CreateVenueAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :venue_addresses do |t|
      t.references :venue, foreign_key: true, null: false
      t.references :address, foreign_key: true, null: false
      t.index([:venue_id, :address_id], unique: true, name: 'unique_venue_and_address')

      t.timestamps
    end
  end
end
