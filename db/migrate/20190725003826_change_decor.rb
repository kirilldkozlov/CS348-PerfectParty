class ChangeDecor < ActiveRecord::Migration[5.2]
  def change
    add_column :decors, :name, :string
    add_column :decors, :desc, :text
  end
end
