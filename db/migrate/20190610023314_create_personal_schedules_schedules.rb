class CreatePersonalSchedulesSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_schedules_schedules do |t|
      t.integer :schedule_id
      t.integer :personal_schedule_id
    end
  end
end
