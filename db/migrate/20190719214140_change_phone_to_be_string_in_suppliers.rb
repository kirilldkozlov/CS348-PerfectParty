class ChangePhoneToBeStringInSuppliers < ActiveRecord::Migration[5.2]
  def change
    change_column :suppliers, :telephone, :string
  end
end
