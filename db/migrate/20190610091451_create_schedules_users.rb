class CreateSchedulesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules_users do |t|
      t.integer :schedule_id
      t.integer :user_id
    end
  end
end
