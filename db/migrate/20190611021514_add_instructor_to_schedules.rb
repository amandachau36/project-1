class AddInstructorToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :instructor, :text
  end
end
