class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string 
  	add_column :users, :company_name, :string 
  	add_column :users, :website, :string 
  end
end
