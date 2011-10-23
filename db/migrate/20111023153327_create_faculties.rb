class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :full_name
      t.string :abbr_name

      t.timestamps
    end
  end
end
