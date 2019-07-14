class CreateEnts < ActiveRecord::Migration[5.2]
  def change
    create_table :ents do |t|
      t.timestamps
    end
  end
end
