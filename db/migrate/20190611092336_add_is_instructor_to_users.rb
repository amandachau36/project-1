class AddIsInstructorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_instructor, :boolean
  end
end
