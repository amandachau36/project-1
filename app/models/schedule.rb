class Schedule < ApplicationRecord
    has_many :enrollments

    has_many :students, class_name: 'User', through: 'Enrollment'



    # has_and_belongs_to_many :students, class_name: 'User'

    #foreign_key required otherwise the association won't be recognized
    belongs_to :instructor, class_name: 'User', optional: true, foreign_key: 'user_id'

    validates :title, presence: true
    validates :duration, presence: true
    validates :start, presence: true
    validate :future_start_date

    # https://github.com/alexreisner/geocoder

    geocoded_by :address
    after_validation :geocode




    def future_start_date
      errors.add(:start, "Date can't be in the past") if
      start < Time.now
    end

end
