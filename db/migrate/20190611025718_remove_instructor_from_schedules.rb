class RemoveInstructorFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :instructor, :text
  end
end
