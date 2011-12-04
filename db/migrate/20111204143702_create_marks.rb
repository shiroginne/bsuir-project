class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :student_id
      t.integer :speciality_subject_term_id
      t.integer :value

      t.timestamps
    end
  end
end
