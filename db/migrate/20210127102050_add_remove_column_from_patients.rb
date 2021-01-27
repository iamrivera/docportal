class AddRemoveColumnFromPatients < ActiveRecord::Migration
  def change
   remove_column :patients, :password, :string
   add_column :patients, :password_digest, :string
  end
end