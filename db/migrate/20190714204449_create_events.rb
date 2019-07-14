class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :client, foreign_key: true
      t.references :venue, foreign_key: true
      t.references :menu, foreign_key: true
      t.references :decor, foreign_key: true
      t.references :ent, foreign_key: true
      t.integer :attendees
      t.date :date
      t.index([:venue_id, :date], unique: true, name: 'single_event_per_date_and_venue')

      t.timestamps
    end
  end
end
