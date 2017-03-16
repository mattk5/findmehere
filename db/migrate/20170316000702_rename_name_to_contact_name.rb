class RenameNameToContactName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :contacts, :name, :contact_name
  end
end
