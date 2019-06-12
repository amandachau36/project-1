class AddNumberOfRepeatsToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :number_of_repeats, :integer
  end
end
