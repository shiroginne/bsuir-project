class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :speciality_id
      t.string :number

      t.timestamps
    end
  end
end
