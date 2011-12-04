class CreateSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.integer :faculty_id
      t.string :abbr_name
      t.string :full_name

      t.timestamps
    end
  end
end
