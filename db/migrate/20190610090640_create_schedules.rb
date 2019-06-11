class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.text :title
      t.text :image
      t.integer :duration
      t.string :level
      t.integer :cost
      t.text :description
      t.datetime :start

      t.timestamps
    end
  end
end
