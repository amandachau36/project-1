class User < ApplicationRecord

  has_many :enrollments

  # source required if you are going a model instead of join table
  has_many :classes_attending, through: 'enrollments', source: 'schedule'




  has_many :classes_teaching, class_name: 'Schedule'

  #necessary for bcrpyt and to link password to password_digest
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  # validates :is_instructor, presence: true

  #required for if cancel or book class should display 
  def already_enrolled?( class_session, date )
    self.enrollments.find_by( date: date, schedule: class_session ).present?
  end


end
