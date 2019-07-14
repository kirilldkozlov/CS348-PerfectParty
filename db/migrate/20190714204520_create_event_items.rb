class CreateEventItems < ActiveRecord::Migration[5.2]
  def change
    create_table :event_items do |t|
      t.references :item, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false
      t.references :supplier, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
