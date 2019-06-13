class AddLatitudeToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :latitude, :float
  end
end
