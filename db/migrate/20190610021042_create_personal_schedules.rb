class CreatePersonalSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_schedules do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
