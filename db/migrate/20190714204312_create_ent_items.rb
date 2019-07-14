class CreateEntItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ent_items do |t|
      t.references :ent, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :quantity
      t.integer :ord

      t.timestamps
    end
  end
end
