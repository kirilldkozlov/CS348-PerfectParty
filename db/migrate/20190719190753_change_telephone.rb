class ChangeTelephone < ActiveRecord::Migration[5.2]
  def change
      change_column :clients, :telephone, :string
  end
end
