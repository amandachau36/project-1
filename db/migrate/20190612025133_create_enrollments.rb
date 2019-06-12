class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :schedule_id
      t.datetime :date

      t.timestamps
    end
  end
end
