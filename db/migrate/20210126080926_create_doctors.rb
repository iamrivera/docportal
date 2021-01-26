class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :bio
      t.string :specialty
      t.string :medical_school
      t.string :residency
      t.string :graduation_date
      t.string :password
      t.timestamps null: false
    end
  end
end
