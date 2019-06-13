class AddLongitudeToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :longitude, :float
  end
end
