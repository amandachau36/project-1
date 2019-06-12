class Enrollment < ApplicationRecord
  belongs_to :student, class_name: 'User', foreign_key: 'user_id'
  belongs_to :schedule

  # has_and_belongs_to_many :students, class_name: 'User'
  # has_and_belongs_to_many :classes_attending, class_name: 'Schedule'

end
