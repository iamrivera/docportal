class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :occupation
      t.string :marital_status
      t.string :birthday
      t.string :doctor
      t.timestamps null: false
    end
  end
end
