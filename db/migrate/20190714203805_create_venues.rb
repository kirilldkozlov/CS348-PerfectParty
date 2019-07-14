class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
