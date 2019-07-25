class ChangeEnt < ActiveRecord::Migration[5.2]
  def change
    add_column :ents, :name, :string
    add_column :ents, :desc, :text
  end
end
