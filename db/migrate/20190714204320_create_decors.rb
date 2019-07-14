class CreateDecors < ActiveRecord::Migration[5.2]
  def change
    create_table :decors do |t|
      t.timestamps
    end
  end
end
