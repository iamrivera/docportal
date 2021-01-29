class AddRemoveColumnFromDoctors < ActiveRecord::Migration
  def change
    remove_column :doctors, :password, :string
    add_column :doctors, :password_digest, :string
  end
end
