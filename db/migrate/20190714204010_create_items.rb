class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :type, null: false, default: 0
      t.string :name, null: false
      t.string :url
      t.text :desc

      t.timestamps
    end
  end
end
