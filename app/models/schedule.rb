class Schedule < ApplicationRecord
    has_and_belongs_to_many :students, class_name: 'Users'
    belongs_to :instructor, class_name: 'Users', optional: true

    validates :title, presence: true
    validates :duration, presence: true
    validates :start, presence: true
end
