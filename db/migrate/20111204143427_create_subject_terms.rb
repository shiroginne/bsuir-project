class CreateSubjectTerms < ActiveRecord::Migration
  def change
    create_table :speciality_subject_terms do |t|
      t.integer :term_id
      t.integer :subject_id
      t.integer :speciality_id

      t.timestamps
    end
  end
end
