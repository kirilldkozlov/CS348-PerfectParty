class CreateDecorItems < ActiveRecord::Migration[5.2]
  def change
    create_table :decor_items do |t|
      t.references :decor, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end
