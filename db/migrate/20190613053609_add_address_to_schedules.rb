class AddAddressToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :address, :text
  end
end
