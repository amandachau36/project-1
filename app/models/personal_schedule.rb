class PersonalSchedule < ApplicationRecord
  # each personal schedule will only belong to one user
  belongs_to :user, optional: true

  # each personal schedule can have many classes and classes can be on multiple personal schedules

  # has_and_belongs_to_many :schedules


end
