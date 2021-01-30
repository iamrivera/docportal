class AddNotesColumnToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :notes, :string
  end
end
