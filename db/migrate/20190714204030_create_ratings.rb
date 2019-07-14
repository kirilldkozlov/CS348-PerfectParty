class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :supplier, foreign_key: true, null: false
      t.text :comment
      t.integer :score

      t.timestamps
    end
  end
end
