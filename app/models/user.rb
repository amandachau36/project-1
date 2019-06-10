class User < ApplicationRecord
  has_one :personal_schedule
  # has_and_belongs_to_many :schedules, through: 'personal_schedule'

  #necessary for bcrpyt and to link password to password_digest
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

end
