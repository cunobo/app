class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer :student_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
